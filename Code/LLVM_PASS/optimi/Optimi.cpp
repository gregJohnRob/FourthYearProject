#include "Optimi.h"

using namespace llvm;
using namespace optimi;


bool Optimi::addAnnotation (
    ValueMap<Value*, Annotation> *annotationGroup,
    StringRef anno,
    Value* value)
{
    std::string annoString = anno.str();
    std::stringstream stream(annoString);
    int data[3];
    for (int i = 0; i < 3; i++) {
        stream >> data[i];
        if (stream.fail()) {
            stream.clear();
            errs() << "Invalid annotation: " << anno.str() << "\n";
            return false;
        }
    }
    Annotation a = Annotation(data[0], data[1], data[2]);
    annotationGroup->insert(std::make_pair(value, a));
}

void Optimi::markEquivalent (std::vector<std::pair<Value *, Value *>> *equivalents, Value * v1, Value * v2)
{
    std::vector<std::pair<Value *, Value *>> tempEquivalents;
    for (auto curr = equivalents->begin(), end = equivalents->end(); curr != end; curr++) {
        if (curr->first == v1 && curr->second == v2) {
            return;
        } else if (curr->second == v1 && curr->first == v2) {
            return;
        }
        if (curr->first == v1) {
            tempEquivalents.push_back(std::make_pair(v2, curr->second));
        }
        if (curr->first == v2) {
            tempEquivalents.push_back(std::make_pair(v1, curr->second));
        }
        if (curr->second == v1) {
            tempEquivalents.push_back(std::make_pair(v2, curr->first));
        }
        if (curr->second == v2) {
            tempEquivalents.push_back(std::make_pair(v1, curr->first));
        }
    }
    for (auto curr = tempEquivalents.begin(), end = tempEquivalents.end(); curr != end; curr++) {
        equivalents->push_back(std::make_pair(curr->first, curr->second));
    }
    equivalents->push_back(std::make_pair(v1, v2));
}

std::pair<Annotation, bool> Optimi::getAnnotation(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, Value *value)
{
    if (ConstantInt *constant = dyn_cast<ConstantInt>(value)) {
        int x = (int) constant->getValue().signedRoundToDouble();
        return std::make_pair(Annotation(x, x, 0), true);
    }
    auto pair = annotationMap->find(value);
    if (pair != annotationMap->end()) {
        return std::make_pair(pair->second, true);
    }
    for (auto curr = equivalents->begin(), end = equivalents->end(); curr != end; curr++) {
        if (curr->first == value) {
            pair = annotationMap->find(curr->second);
            if (pair != annotationMap->end()) {
                return std::make_pair(pair->second, true);
            }
        } else if (curr->second == value) {
            pair = annotationMap->find(curr->first);
            if (pair != annotationMap->end()) {
                return std::make_pair(pair->second, true);
            }
        }
    }
    return std::make_pair(Annotation(Annotation::INT), false);
}

void Optimi::handleStore(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, StoreInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction->getOperand(1);
    markEquivalent(equivalents, op0, op1);
}

void Optimi::handleLoad(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, LoadInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction;
    markEquivalent(equivalents, op1, op0);
}

void Optimi::handleAdd(ValueMap<Value *, Annotation> *annotationMap, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
    long max = INT_MIN;
    long min = INT_MAX;
    long range[4] = {anno0.max + anno1.max, anno0.max + anno1.min, anno0.min + anno1.max, anno0.min + anno1.min};
    for (int i = 0; i < 4; i++) {
        if (range[i] > max) {
            max = range[i];
        }
        if (range[i] < min) {
            min = range[i];
        }
    }
    errs() << "Saving annotation: (" << max << ", " << min << ",0)" << "\n";
    annotationMap->insert(std::make_pair(instruction, Annotation(max, min, 0)));
}

void Optimi::handleMul(ValueMap<Value *, Annotation> *annotationMap, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
    long max = INT_MIN;
    long min = INT_MAX;
    long range[4] = {anno0.max * anno1.max, anno0.max * anno1.min, anno0.min * anno1.max, anno0.min * anno1.min};
    for (int i = 0; i < 4; i++) {
        if (range[i] > max) {
            max = range[i];
        }
        if (range[i] < min) {
            min = range[i];
        }
    }
    errs() << "Saving annotation: (" << max << ", " << min << ",0)" << "\n";
    annotationMap->insert(std::make_pair(instruction, Annotation(max, min, 0)));
}

void Optimi::handleSub(ValueMap<Value *, Annotation> *annotationMap, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
    long max = INT_MIN;
    long min = INT_MAX;
    long range[8] = {anno0.max - anno1.max,
                     anno0.max - anno1.min,
                     anno0.min - anno1.max,
                     anno0.min - anno1.min};
    for (int i = 0; i < 4; i++) {
        if (range[i] > max) {
            max = range[i];
        }
        if (range[i] < min) {
            min = range[i];
        }
    }
    errs() << "Saving annotation: (" << max << ", " << min << ",0)" << "\n";
    annotationMap->insert(std::make_pair(instruction, Annotation(max, min, 0)));
}

void Optimi::handleShl(ValueMap<Value *, Annotation> *annotationMap, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
    int max = anno0.max * 2;
    int min = anno0.min * 2;
    errs() << "Saving annotation: (" << max << ", " << min << ",0)" << "\n";
    annotationMap->insert(std::make_pair(instruction, Annotation(max, min, 0)));
}

void Optimi::handleBinaryOperator(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, BinaryOperator *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction->getOperand(1);
    std::pair<Annotation, bool> pair0 = getAnnotation(annotationMap, equivalents, op0);
    std::pair<Annotation, bool> pair1 = getAnnotation(annotationMap, equivalents, op1);
    errs() << "\t";
    if (pair0.second) {
        errs() << "Got annotation for op0: " << pair0.first.tostr() << ". ";
    } else {
        errs() << "Failed to get annotation for " << op0 << ". ";
    }
    if (pair1.second) {
        errs() << "Got annotation for op1: " << pair1.first.tostr() << ". ";
    } else {
        errs() << "Failed to get annotation for " << op1 << ". ";
    }
    Annotation anno0 = pair0.first;
    Annotation anno1 = pair1.first;
    switch (instruction->getOpcode()) {
        case Instruction::Add : {
            handleAdd(annotationMap, instruction, anno0, anno1);
            break;
        }
        case Instruction::Mul : {
            handleMul(annotationMap, instruction, anno0, anno1);
            break;
        }
        case Instruction::Sub : {
            handleSub(annotationMap, instruction, anno0, anno1);
            break;
        }
        case Instruction::Shl : {
            handleShl(annotationMap, instruction, anno0, anno1);
            break;
        }
        default: {
            errs() << "Unable to work out the annotation for the given opcode\n";
            annotationMap->insert(std::make_pair(instruction, Annotation(Annotation::INT)));
        }
    }
    Annotation annotation = annotationMap->find(instruction)->second;
    LLVMContext& C = instruction->getContext();
    MDNode* N = MDNode::get(C, MDString::get(C, annotation.tostr()));
    instruction->setMetadata("optimi", N);
    errs() << "\n";
}

void Optimi::handleBitCast(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, BitCastInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction;
    markEquivalent(equivalents, op1, op0);
}

void Optimi::handleGetElementPtr(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, GetElementPtrInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction;
    markEquivalent(equivalents, op1, op0);
}

void Optimi::handleFunctionCall(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, CallInst *instruction)
{
    StringRef name = instruction->getCalledFunction()->getName();
    if (name == "llvm.var.annotation") { // if this is an annotation, then get the annotation string
        Value *variable = instruction->getOperand(0);
        Value *val = instruction->getArgOperand(1); // cast to a function call and get the second operand
        Value *us = cast<User>(*val).getOperand(0); // Get the pointer to the global where the annotation is stored
        StringRef anno = cast<ConstantDataArray>(cast<User>(*us).getOperand(0))->getAsCString(); // get the annotation as a string
        addAnnotation(annotationMap, anno, variable);
        Annotation anna = annotationMap->find(variable)->second;
        variable = annotationMap->find(variable)->first;
        errs() << "\tAdded annotation: " << anna.tostr() <<  " and relating it to " << variable->getName() << "\n";
    }
}

void Optimi::functionPass(Function &F)
{
    // if this is an llvm function then just return
    if (F.getName().find("llvm") != std::string::npos) {
        errs() << "Ignoring function: " << F.getName() << "\n\n";
        return;
    }

    ValueMap<Value *, Annotation> localAnnotations;
    std::vector<std::pair<Value *, Value *>> equivalents; // use this to sort what variables are equivalent to one another

    errs() << "Analysing function: " << F.getName() << "\n";
    for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        if (StoreInst *store = dyn_cast<StoreInst>(&*I)) {
            handleStore(&localAnnotations, &equivalents, store);
        } else if (LoadInst *load = dyn_cast<LoadInst>(&*I)) {
            handleLoad(&localAnnotations, &equivalents, load);
        } else if (GetElementPtrInst *elemAddr = dyn_cast<GetElementPtrInst>(&*I)) {
            handleGetElementPtr(&localAnnotations, &equivalents, elemAddr);
        } else if (BinaryOperator *binaryOperator = dyn_cast<BinaryOperator>(&*I)) {
            handleBinaryOperator(&localAnnotations, &equivalents, binaryOperator);
        } else if (BitCastInst *bitCast = dyn_cast<BitCastInst>(&*I)) {
            handleBitCast(&localAnnotations, &equivalents, bitCast);
        } else if (CallInst *call = dyn_cast<CallInst>(&*I)) {
            handleFunctionCall(&localAnnotations, &equivalents, call);
        }
    }
    errs() << "\n";
}

bool Optimi::runOnModule(Module &M)
{
    GlobalVariable *global_annos = M.getNamedGlobal("llvm.global.annotations");
    if (global_annos) {
        ConstantArray *a = cast<ConstantArray>(global_annos->getOperand(0));
        for (int i=0; i < a->getNumOperands(); i++) {
            ConstantStruct *e = cast<ConstantStruct>(a->getOperand(i));
            Value* annoValue = e->getOperand(0)->getOperand(0);
            StringRef anno = cast<ConstantDataArray>(cast<GlobalVariable>(e->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
            addAnnotation(&this->globalAnnotations, anno, annoValue);
        }
    }

    for (Module::iterator curFunc = M.begin(), endFunc = M.end(); curFunc != endFunc; ++curFunc) {
        this->functionPass(*curFunc);
    }
    return false;
}


/*
 * This is how the pass gets registered and will run
 */
char Optimi::ID = 0;
RegisterPass<Optimi> X("passname", "Pass Name Analysis");
void registerPass(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new Optimi());
}
RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible, registerPass);
