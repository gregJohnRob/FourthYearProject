#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Constant Annotations
///////////////////////////////////////////////////////////////////////////////////////////////////
const Annotation ERRNO = Annotation(3546, 0, 0);
const Annotation WORST_CASE_INT = Annotation(INT_MAX, INT_MIN, 0);
const Annotation COMPARISON = Annotation(1, 0, 0);
const Annotation PUTS = WORST_CASE_INT;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Public methods
///////////////////////////////////////////////////////////////////////////////////////////////////
Marker::Marker() {}

void Marker::analyseInstruction(Value *v)
{
    if (StoreInst *store = dyn_cast<StoreInst>(v)) {
        this->handle_store(store);
    } else if (LoadInst *load = dyn_cast<LoadInst>(v)) {
        this->handle_load(load);
    } else if (SelectInst *select = dyn_cast<SelectInst>(v)) {
        this->handle_select(select);
    } else if (PHINode *phi = dyn_cast<PHINode>(v)) {
        this->handle_phi(phi);
    } else if (BinaryOperator *binary = dyn_cast<BinaryOperator>(v)) {
        this->handle_binary_operator(binary);
    } else if (CastInst *cast = dyn_cast<CastInst>(v)) {
        this->handle_cast(cast);
    } else if (GetElementPtrInst *elemAddr = dyn_cast<GetElementPtrInst>(v)) {
        this->handle_getelementptr(elemAddr);
    } else if (CallInst *call = dyn_cast<CallInst>(v)) {
        this->handle_call(call);
    } else if (TruncInst *truncInst = dyn_cast<TruncInst>(v)) {
        this->handle_trunc(truncInst);
    } else if (CmpInst *cmp = dyn_cast<CmpInst>(v)) {
        this->handle_cmp(cmp);
    }
}

int Marker::finishMethodAnalysis()
{
    int output;
    if (this->dependencyMap.empty()) {
        output = 1;
    } else {
        for (auto i = this->dependencyMap.begin(), end = this->dependencyMap.end(); i != end; i++) {
            errs() << "\t";
            i->first->dump();
            for (auto innerI = i->second.begin(), innerEnd = i->second.end(); innerI != innerEnd; innerI++) {
                errs() << "\t\t";
                (*innerI)->instruction->dump();
            }
            this->addAnnotation(i->first, WORST_CASE_INT);
        }
        output = -1;
    }
    for (unsigned i = 0; i < this->dependencyVector.size(); i++) {
        DependencyCounter *dc = dependencyVector[i];
        delete dc;
    }
    return output;
}

void Marker::setFunction(Function *F) {
    this->F = F;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Terminator Instruction Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_ret(ReturnInst *instruction) {
    Value *v = instruction->getReturnValue();
    Annotation a, f;
    if (this->hasAnnotation(v) && this->hasAnnotation(this->F)) {
        a = this->getAnnotation(v);
        f = this->getAnnotation(F);
        if (a.max != f.max || a.min != f.min || a.precision != f.precision) {
            errs() << "This function has a booboo\n";
        }
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Binary Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_binary_operator(BinaryOperator *instruction)
{
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
        case Instruction::FAdd :
        case Instruction::Add  : {
            this->handle_add(target, a0, a1);
            break;
        }
        case Instruction::FSub :
        case Instruction::Sub  : {
            this->handle_sub(target, a0, a1);
            break;
        }
        case Instruction::FMul :
        case Instruction::Mul  : {
            this->handle_mul(target, a0, a1);
            break;
        }
        case Instruction::UDiv  : {
            this->handle_udiv(target, a0, a1);
            break;
        }
        case Instruction::SDiv  : {
            this->handle_sdiv(target, a0, a1);
            break;
        }
        case Instruction::FDiv  : {
            this->handle_fdiv(target, a0, a1);
            break;
        }
        case Instruction::URem  : {
            this->handle_urem(target, a0, a1);
            break;
        }
        case Instruction::SRem  : {
            this->handle_srem(target, a0, a1);
            break;
        }
        case Instruction::FRem  : {
            this->handle_frem(target, a0, a1);
            break;
        }
        // Bit wise operations
        case Instruction::Shl  : {
            this->handle_shl(target, a0, a1);
            break;
        }
        case Instruction::LShr : {
            this->handle_lshr(target, a0, a1);
            break;
        }
        case Instruction::AShr : {
            this->handle_ashr(target, a0, a1);
            break;
        }
        case Instruction::And  : {
            this->handle_and(target, a0, a1);
            break;
        }
        case Instruction::Or   : {
            this->handle_or(target, a0, a1);
            break;
        }
        case Instruction::Xor  : {
            this->handle_xor(target, a0, a1);
            break;
        }
        default: {
            errs() << "Unable to work out the annotation for the given opcode";
            this->addAnnotation(target, WORST_CASE_INT);
        }
        }
    }
}

void Marker::handle_add(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max + a1.max,
        a0.max + a1.min,
        a0.min + a1.max,
        a0.min + a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_mul(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max * a1.max,
        a0.max * a1.min,
        a0.min * a1.max,
        a0.min * a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_sub(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max - a1.max,
        a0.max - a1.min,
        a0.min - a1.max,
        a0.min - a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_udiv(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        std::abs(a0.max / a1.max),
        std::abs(a0.max / a1.min),
        std::abs(a0.min / a1.max),
        std::abs(a0.min / a1.min)
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_sdiv(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max / a1.max,
        a0.max / a1.min,
        a0.min / a1.max,
        a0.min / a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_fdiv(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max / a1.max,
        a0.max / a1.min,
        a0.min / a1.max,
        a0.min / a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_urem(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        std::abs(fmod(a0.max, a1.max)),
        std::abs(fmod(a0.max, a1.min)),
        std::abs(fmod(a0.min, a1.max)),
        std::abs(fmod(a0.min, a1.min))
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_srem(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        fmod(a0.max, a1.max),
        fmod(a0.max, a1.min),
        fmod(a0.min, a1.max),
        fmod(a0.min, a1.min)
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_frem(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        fmod(a0.max, a1.max),
        fmod(a0.max, a1.min),
        fmod(a0.min, a1.max),
        fmod(a0.min, a1.min)
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Bitwise Binary Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_shl(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max * pow(2, a1.max),
        a0.max * pow(2, a1.min),
        a0.min * pow(2, a1.max),
        a0.min * pow(2, a1.min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_ashr(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max / pow(2, a1.max),
        a0.max / pow(2, a1.min),
        a0.min / pow(2, a1.max),
        a0.min / pow(2, a1.min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_lshr(Value *target, Annotation a0, Annotation a1)
{
    unsigned int a0max = ceil(a0.max);
    unsigned int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max >> a1max),
        double(a0max >> a1min),
        double(a0min >> a1max),
        double(a0min >> a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_and(Value *target, Annotation a0, Annotation a1)
{
    int a0max = ceil(a0.max);
    int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max & a1max),
        double(a0max & a1min),
        double(a0min & a1max),
        double(a0min & a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_or(Value *target, Annotation a0, Annotation a1)
{
    int a0max = ceil(a0.max);
    int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max | a1max),
        double(a0max | a1min),
        double(a0min | a1max),
        double(a0min | a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));;
}

void Marker::handle_xor(Value *target, Annotation a0, Annotation a1)
{
    int a0max = ceil(a0.max);
    int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max ^ a1max),
        double(a0max ^ a1min),
        double(a0min ^ a1max),
        double(a0min ^ a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Vector Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
// Aggregate Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
// Memory Access and Addressing Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_store(StoreInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction->getOperand(1);
    this->markEquivalent(v1, v2, instruction);

}

void Marker::handle_load(LoadInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}

void Marker::handle_getelementptr(GetElementPtrInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// Conversion Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_cast(CastInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}

void Marker::handle_trunc(TruncInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}

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
        if (this->hasAnnotation(function)) {
            this->handleAnnotation(instruction, this->getAnnotation(function));
        } else {
            this->noteEquivalentDependency(function, instruction, instruction);
        }
    }
}



///////////////////////////////////////////////////////////////////////////////////////////////////
// Methods for interacting with dependencyMap, annotationMap
///////////////////////////////////////////////////////////////////////////////////////////////////

int Marker::handleAnnotation(Value *v, Annotation a) {
    if (this->hasAnnotation(v)) {
        errs() << "\t"<< v << " already has an annotation.\n";
        errs() << "\t\t";
        v->dump();
        return -1;
    }
    this->addAnnotation(v, a);
    this->cleanDependencies(v);
    return 1;
}

bool Marker::hasAnnotation(Value *v)
{
    if (ConstantInt *constant = dyn_cast<ConstantInt>(v)) {
        return true;
    } else if (ConstantFP *constantFP = dyn_cast<ConstantFP>(v)) {
        return true;
    }
    return this->annotationMap.find(v) != this->annotationMap.end();
}

Annotation Marker::getAnnotation(Value *v)
{
    if (ConstantInt *constantInt = dyn_cast<ConstantInt>(v)) {
        double x = constantInt->getValue().signedRoundToDouble();
        return Annotation(x, x, 0);
    } else if (ConstantFP *constantFP = dyn_cast<ConstantFP>(v)) {
        double x;
        if (constantFP->getType()->isFloatTy()) {
            x = constantFP->getValueAPF().convertToFloat();
        } else if (constantFP->getType()->isDoubleTy()) {
            x = constantFP->getValueAPF().convertToDouble();
        } else {
            x = 0.0;
            errs() << "constantFP is neither a double nor a float. ";
            constantFP->dump();
        }
        int i = 0;
        double check = x;
        while (fmod(check, 1) != 0.0) {
            i++;
            check *= 10;
        }
        return Annotation(x, x, i);
    }
    return this->annotationMap.find(v)->second;
}

/*
    Check if the value already has an annotation, and if it does then check that they are consistent or flag a warning
    if value has annotation
        if previous_annotation != a
            print warning
    if a would require more data than current type of instruction
        print warning
 */
void Marker::addAnnotation(Value *v, Annotation a)
{
    bool carryOn = this->checkForErrors(v,a);
    if (!carryOn) {
        return;
    }
    if (Instruction *instruction = dyn_cast<Instruction>(v)) {
        LLVMContext& C = instruction->getContext();
        MDNode* N = MDNode::get(C, MDString::get(C, a.str()));
        instruction->setMetadata("optimi", N);
    }
    this->annotationMap.insert(std::make_pair(v, a));
}

void Marker::addDependencyCounter(Value *v, DependencyCounter *dc)
{
    auto temp = this->dependencyMap.find(v);
    if (temp != this->dependencyMap.end()) {
        temp->second.push_back(dc);
    } else {
        std::vector<DependencyCounter *> dcVector;
        dcVector.push_back(dc);
        this->dependencyMap.insert(std::make_pair(v, dcVector));
    }
}

void Marker::cleanDependencies(Value *v)
{
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

void Marker::markEquivalent(Value *v1, Value *v2, Value *instruction) {
    if (this->hasAnnotation(v1) && this->hasAnnotation(v2)) {
        return;
    }
    if (this->hasAnnotation(v1)) {
        this->handleAnnotation(v2, this->getAnnotation(v1));
    } else if (this->hasAnnotation(v2)) {
        this->handleAnnotation(v1, this->getAnnotation(v2));
    } else {
        this->noteEquivalentDependency(v1, v2, instruction);
    }
}

void Marker::noteEquivalentDependency(Value *v1, Value *v2, Value *instruction) {
    DependencyCounter *dependencyCounter = new DependencyCounter();
    dependencyCounter->numOfDependencies = 1;
    dependencyCounter->instruction = instruction;
    this->dependencyVector.push_back(dependencyCounter);
    this->addDependencyCounter(v1, dependencyCounter);
    this->addDependencyCounter(v2, dependencyCounter);
}

bool Marker::checkForErrors(Value *v, Annotation a) {
    if (this->hasAnnotation(v)) {
        Annotation currA = this->getAnnotation(v);
        if (a.max != currA.max || a.min != currA.max || a.precision != currA.precision) {
            if (v->hasName()) {
                errs() << "\tValue " << v->getName().str()  << " is already annotated\n";
            } else {
                errs() << "\tValue " << v << " is already annotated\n";
            }
            return false;
        }
    }
    Type *t = v->getType();
    if (t->isIntegerTy()) {
        unsigned numBits = t->getIntegerBitWidth();
        double l = log2((a.max > std::abs(a.min)) ? a.max : std::abs(a.min));
        unsigned numBitsA = (unsigned int)std::ceil(l);
        if (numBits < numBitsA) {
            if (v->hasName()) {
                errs() << "\tThe number of bits required to handle " << v->getName().str()  << " is more than is in the default integer size\n";
            } else {
                errs() << "\tThe number of bits required to handle " << v << " is more than is in the default integer size\n";
            }
        }
    }
    return true;
}
