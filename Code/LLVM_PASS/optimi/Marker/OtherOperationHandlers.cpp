#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Other Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_cmp(CmpInst *instruction) {
    // left (<|>|<>|=<|>=) right
    Value *left = instruction->getOperand(0);
    Value *right = instruction->getOperand(1);
    bool hasLeft = this->hasAnnotation(left);
    bool hasRight = this->hasAnnotation(right);
    if (!this->hasAnnotation(instruction)) {
        this->handleAnnotation(instruction, COMPARISON);
    }
    if (hasLeft && hasRight) {
        return;
    }
    if (!hasLeft && hasRight) {
        Annotation rightAnno = this->getAnnotation(right);
        switch(instruction->getPredicate()) {
            // This is so that it is possible to handle incrementers in the program.
            case CmpInst::ICMP_EQ : {
                this->handleAnnotation(left, Annotation(rightAnno.max + 1, 0, 0));
                break;
            }
        }
    }
}

void Marker::handle_phi(PHINode *instruction)
{
    if (this->hasAnnotation(instruction)) {
        return;
    }
    unsigned number = instruction->getNumIncomingValues();
    unsigned i;
    long max, min, prec;
    max = INT_MIN;
    min = INT_MAX;
    prec = INT_MIN;
    DependencyCounter *d = new DependencyCounter();
    d->numOfDependencies = 0;
    d->instruction = instruction;
    for (i = 0; i < number; i++) {
        Value *v = instruction->getIncomingValue(i);
        if (this->hasAnnotation(v)) {
            Annotation a = this->getAnnotation(v);
            if (a.max > max) {
                max = a.max;
            }
            if (a.min < min) {
                min = a.min;
            }
            if (a.precision > prec) {
                prec = a.precision;
            }
        } else {
            d->numOfDependencies++;
            this->addDependencyCounter(v, d);
        }
    }
    if (d->numOfDependencies == 0) {
        delete d;
        Annotation instructionA = Annotation(max, min, prec);
        this->handleAnnotation(instruction, instructionA);
    }
}

void Marker::handle_select(SelectInst *instruction)
{
    if (this->hasAnnotation(instruction)) {
        return;
    }
    Value *trueV = instruction->getTrueValue();
    Annotation trueA;
    Value *falseV = instruction->getFalseValue();
    Annotation falseA;
    DependencyCounter *d = new DependencyCounter();
    d->instruction = instruction;
    if (!this->hasAnnotation(trueV)) {
        d->numOfDependencies++;
        this->addDependencyCounter(trueV, d);
    } else {
        trueA = this->getAnnotation(trueV);
    }
    if (!this->hasAnnotation(falseV)) {
        d->numOfDependencies++;
        this->addDependencyCounter(falseV, d);
    } else {
        falseA = this->getAnnotation(falseV);
    }
    if (d->numOfDependencies == 0) {
        delete d;
        Annotation instructionA = Annotation(
                                      ((trueA.max > falseA.max) ? trueA.max : falseA.max),
                                      ((trueA.min < falseA.min) ? trueA.min : falseA.min),
                                      ((trueA.precision > falseA.precision) ? trueA.precision : falseA.precision)
                                  );
        this->handleAnnotation(instruction, instructionA);
    }
}

void Marker::handle_call(CallInst *instruction)
{
    StringRef name = instruction->getCalledFunction()->getName();
    if (name == "llvm.var.annotation") { // if this is an annotation, then get the annotation string
        Value *variable = instruction->getOperand(0);
        Value *val = instruction->getArgOperand(1); // cast to a function call and get the second operand
        Value *us = cast<User>(*val).getOperand(0); // Get the pointer to the global where the annotation is stored
        StringRef anno = cast<ConstantDataArray>(cast<User>(*us).getOperand(0))->getAsCString(); // get the annotation as a string
        Annotation a = Annotation(anno.str());
        this->addAnnotation(variable, a);
        this->cleanDependencies(variable);
    } else if (
        name == "llvm.lifetime.end" ||
        name == "llvm.lifetime.start" ||
        name.find("llvm.memcpy") == 0) {
        // ignore
        return;
    } else if (name == "posix_memalign") {
        this->handleAnnotation(instruction, ERRNO);
    } else if (name == "puts" || name == "printf"){
        this->handleAnnotation(instruction, PUTS);
    } else {
        Value *function = instruction->getCalledValue();
        if (!function || instruction->getFunctionType()->getReturnType()->getTypeID() == Type::VoidTyID) {
            // ignore
            return;
        }
        if (this->hasAnnotation(function)) {
            this->handleAnnotation(instruction, this->getAnnotation(function));
        } else {
            this->noteEquivalentDependency(function, instruction, instruction);
        }
    }
}
