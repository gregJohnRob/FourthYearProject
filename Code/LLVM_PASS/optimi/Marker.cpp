#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Public methods
///////////////////////////////////////////////////////////////////////////////////////////////////
void Marker::analyseInstruction(Value *v) {
    if (StoreInst *store = dyn_cast<StoreInst>(v)) {
        this->handleStore(store);
    } else if (LoadInst *load = dyn_cast<LoadInst>(v)) {
        this->handleLoad(load);
    } else if (SelectInst *select = dyn_cast<SelectInst>(v)) {
        this->handleSelect(select);
    } else if (PHINode *phi = dyn_cast<PHINode>(v)) {
        this->handlePhi(phi);
    } else if (BinaryOperator *binary = dyn_cast<BinaryOperator>(v)) {
        this->handleBinaryOperator(binary);
    } else if (BitCastInst *bitCast = dyn_cast<BitCastInst>(v)) {
        this->handleBitCast(bitCast);
    } else if (GetElementPtrInst *elemAddr = dyn_cast<GetElementPtrInst>(v)) {
        this->handleGetElementPtr(elemAddr);
    } else if (CallInst *call = dyn_cast<CallInst>(v)) {
        this->handleFunctionCall(call);
    } else if (TruncInst *truncInst = dyn_cast<TruncInst>(v)) {
        this->handleTrunc(truncInst);
    }
}

int Marker::finishMethodAnalysis() {
    int output;
    if (this->dependencyMap.empty()) {
        output = 1;
    } else {
        for (auto i = this->dependencyMap.begin(), end = this->dependencyMap.end(); i != end; i++) {
            errs() << "\t";
            i->first->dump();
        }
        output = -1;
    }
    for (unsigned i = 0; i < this->dependencyVector.size(); i++) {
        DependencyCounter *dc = dependencyVector[i];
        delete dc;
    }
    return output;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Methods for interacting with dependencyMap, annotationMap
///////////////////////////////////////////////////////////////////////////////////////////////////

bool Marker::hasAnnotation(Value *v) {
    if (ConstantInt *constant = dyn_cast<ConstantInt>(v)) {
        return true;
    }
    return this->annotationMap.find(v) != this->annotationMap.end();
}

Annotation Marker::getAnnotation(Value *v) {
    if (ConstantInt *constant = dyn_cast<ConstantInt>(v)) {
        double x = constant->getValue().signedRoundToDouble();
        return Annotation(x, x, 0);
    }
    return this->annotationMap.find(v)->second;
}

void Marker::addAnnotation(Value *v, Annotation a) {
    if (Instruction *instruction = dyn_cast<Instruction>(v)) {
        LLVMContext& C = instruction->getContext();
        MDNode* N = MDNode::get(C, MDString::get(C, a.str()));
        instruction->setMetadata("optimi", N);
    }
    this->annotationMap.insert(std::make_pair(v, a));
}

void Marker::addDependencyCounter(Value *v, DependencyCounter *dc) {
    auto temp = this->dependencyMap.find(v);
    if (temp != this->dependencyMap.end()) {
        temp->second.push_back(dc);
    } else {
        std::vector<DependencyCounter *> dcVector;
        dcVector.push_back(dc);
        this->dependencyMap.insert(std::make_pair(v, dcVector));
    }
}

void Marker::cleanDependencies(Value *v) {
    auto temp = this->dependencyMap.find(v);
    if (temp == this->dependencyMap.end()) {
        return;
    }
    std::vector<DependencyCounter *> dcVector = temp->second;
    for (unsigned i = 0; i < dcVector.size(); i++) {
        DependencyCounter *dc = dcVector[i];
        if (--dc->numOfDependencies == 0) {
            analyseInstruction(dc->instruction);
        }
    }
    this->dependencyMap.erase(v);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Instruction handler methods
///////////////////////////////////////////////////////////////////////////////////////////////////
void Marker::handleStore(StoreInst *instruction) {
    Value *target = instruction->getOperand(0);
    Value *value = instruction->getOperand(1);
    if (this->hasAnnotation(target) && this->hasAnnotation(value)) {
        return;
    }
    if (this->hasAnnotation(target)) {
        this->addAnnotation(value, this->getAnnotation(target));
        this->cleanDependencies(value);
    } else if (this->hasAnnotation(value)) {
        this->addAnnotation(target, this->getAnnotation(value));
        this->cleanDependencies(target);
    } else {
        DependencyCounter *dependencyCounter = new DependencyCounter();
        dependencyCounter->numOfDependencies = 1;
        dependencyCounter->instruction = instruction;
        this->dependencyVector.push_back(dependencyCounter);
        this->addDependencyCounter(target, dependencyCounter);
        this->addDependencyCounter(value, dependencyCounter);
    }
}

void Marker::handleLoad(LoadInst *instruction) {
    Value *value = instruction->getOperand(0);
    Value *target = instruction;
    if (this->hasAnnotation(target) && this->hasAnnotation(value)) {
        return;
    }
    if (this->hasAnnotation(target)) {
        this->addAnnotation(value, this->getAnnotation(target));
        this->cleanDependencies(value);
    } else if (this->hasAnnotation(value)) {
        this->addAnnotation(target, this->getAnnotation(value));
        this->cleanDependencies(target);
    } else {
        DependencyCounter *dependencyCounter = new DependencyCounter();
        dependencyCounter->numOfDependencies = 1;
        dependencyCounter->instruction = instruction;
        this->dependencyVector.push_back(dependencyCounter);
        this->addDependencyCounter(target, dependencyCounter);
        this->addDependencyCounter(value, dependencyCounter);
    }
}

void Marker::handleSelect(SelectInst *instruction) {
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
        this->addAnnotation(instruction, instructionA);
        this->cleanDependencies(instruction);
    }
}

void Marker::handlePhi(PHINode *instruction) {
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

        } else {
            d->numOfDependencies++;
            this->addDependencyCounter(v, d);
        }
    }
    if (d->numOfDependencies == 0) {
        delete d;
        Annotation instructionA = Annotation(max, min, prec);
        this->addAnnotation(instruction, instructionA);
        this->cleanDependencies(instruction);
    }
}

void Marker::handleBinaryOperator(BinaryOperator *instruction) {
    if (this->hasAnnotation(instruction)) {
        return;
    }
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction->getOperand(1);
    Annotation a0, a1;
    Value *target = instruction;
    DependencyCounter *d = new DependencyCounter();
    d->instruction = instruction;
    if (this->hasAnnotation(op0)) {
        a0 = this->getAnnotation(op0);
    } else {
        d->numOfDependencies++;
        this->addDependencyCounter(op0, d);
    }
    if (this->hasAnnotation(op1)) {
        a1 = this->getAnnotation(op1);
    } else {
        d->numOfDependencies++;
        this->addDependencyCounter(op1, d);
    }
    if (d->numOfDependencies == 0) {
        switch (instruction->getOpcode()) {
            case Instruction::Add : {
                this->handleAdd(target, a0, a1);
                break;
            }
            case Instruction::Mul : {
                this->handleMul(target, a0, a1);
                break;
            }
            case Instruction::Sub : {
                this->handleSub(target, a0, a1);
                break;
            }
            // case Instruction::Shl : {
            //     handleShl(annotationStore, instruction, anno0, anno1);
            //     break;
            // }
            default: {
                errs() << "Unable to work out the annotation for the given opcode";
                this->addAnnotation(target, Annotation(INT_MAX, INT_MIN, 0));
            }
        }
    }
}

void Marker::handleBitCast(BitCastInst *instruction) {
    Value *value = instruction->getOperand(0);
    Value *target = instruction;
    if (this->hasAnnotation(target) && this->hasAnnotation(value)) {
        return;
    }
    if (this->hasAnnotation(target)) {
        this->addAnnotation(value, this->getAnnotation(target));
        this->cleanDependencies(value);
    } else if (this->hasAnnotation(value)) {
        this->addAnnotation(target, this->getAnnotation(value));
        this->cleanDependencies(target);
    } else {
        DependencyCounter *dependencyCounter = new DependencyCounter();
        dependencyCounter->numOfDependencies = 1;
        dependencyCounter->instruction = instruction;
        this->dependencyVector.push_back(dependencyCounter);
        this->addDependencyCounter(target, dependencyCounter);
        this->addDependencyCounter(value, dependencyCounter);
    }
}

void Marker::handleTrunc(TruncInst *instruction) {
    Value *value = instruction->getOperand(0);
    Value *target = instruction;
    if (this->hasAnnotation(target) && this->hasAnnotation(value)) {
        return;
    }
    if (this->hasAnnotation(target)) {
        this->addAnnotation(value, this->getAnnotation(target));
        this->cleanDependencies(value);
    } else if (this->hasAnnotation(value)) {
        this->addAnnotation(target, this->getAnnotation(value));
        this->cleanDependencies(target);
    } else {
        DependencyCounter *dependencyCounter = new DependencyCounter();
        dependencyCounter->numOfDependencies = 1;
        dependencyCounter->instruction = instruction;
        this->dependencyVector.push_back(dependencyCounter);
        this->addDependencyCounter(target, dependencyCounter);
        this->addDependencyCounter(value, dependencyCounter);
    }
}

void Marker::handleGetElementPtr(GetElementPtrInst *instruction) {
    Value *value = instruction->getOperand(0);
    Value *target = instruction;
    if (this->hasAnnotation(target) && this->hasAnnotation(value)) {
        return;
    }
    if (this->hasAnnotation(target)) {
        this->addAnnotation(value, this->getAnnotation(target));
        this->cleanDependencies(value);
    } else if (this->hasAnnotation(value)) {
        this->addAnnotation(target, this->getAnnotation(value));
        this->cleanDependencies(target);
    } else {
        DependencyCounter *dependencyCounter = new DependencyCounter();
        dependencyCounter->numOfDependencies = 1;
        dependencyCounter->instruction = instruction;
        this->dependencyVector.push_back(dependencyCounter);
        this->addDependencyCounter(target, dependencyCounter);
        this->addDependencyCounter(value, dependencyCounter);
    }
}

void Marker::handleFunctionCall(CallInst *instruction) {
    StringRef name = instruction->getCalledFunction()->getName();
    if (name == "llvm.var.annotation") { // if this is an annotation, then get the annotation string
        Value *variable = instruction->getOperand(0);
        Value *val = instruction->getArgOperand(1); // cast to a function call and get the second operand
        Value *us = cast<User>(*val).getOperand(0); // Get the pointer to the global where the annotation is stored
        StringRef anno = cast<ConstantDataArray>(cast<User>(*us).getOperand(0))->getAsCString(); // get the annotation as a string
        Annotation a = Annotation(anno.str());
        this->addAnnotation(variable, a);
        this->cleanDependencies(variable);
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Extra handler methods
///////////////////////////////////////////////////////////////////////////////////////////////////
 // Value *op0, Value *op1, Annotation a0, Annotation a1, Value *target
void Marker::handleAdd(Value *target, Annotation a0, Annotation a1) {
    double range[4] = {
        a0.max + a1.max,
        a0.max + a1.min,
        a0.min + a1.max,
        a0.min + a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->saveNewAnnotation(target, range, precision);
}

void Marker::handleMul(Value *target, Annotation a0, Annotation a1) {
    double range[4] = {
        a0.max * a1.max,
        a0.max * a1.min,
        a0.min * a1.max,
        a0.min * a1.min
    };
    int precision = a0.precision * a1.precision;
    this->saveNewAnnotation(target, range, precision);
}

void Marker::handleSub(Value *target, Annotation a0, Annotation a1) {
    double range[4] = {
        a0.max - a1.max,
        a0.max - a1.min,
        a0.min - a1.max,
        a0.min - a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->saveNewAnnotation(target, range, precision);
}

void Marker::saveNewAnnotation(Value *target, double range[4], int precision) {
    double max, min;
    max = min = range[0];
    precision = INT_MIN;
    for (int i = 1; i < 4; i++) {
        if (range[i] > max) {
            max = range[i];
        }
        if (range[i] < min) {
            min = range[i];
        }
    }
    this->addAnnotation(target, Annotation(max, min, precision));
}
