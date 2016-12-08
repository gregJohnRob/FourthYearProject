#include "Optimi.h"

using namespace llvm;
using namespace optimi;

void Optimi::handleStore(AnnotationStore* annotationStore, StoreInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction->getOperand(1);
    annotationStore->markEquivalent(op0, op1);
}

void Optimi::handleLoad(AnnotationStore* annotationStore, LoadInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction;
    annotationStore->markEquivalent(op0, op1);
}

void Optimi::handleSelect(AnnotationStore *annotationStore, SelectInst *instruction)
{
    Value *t = instruction->getTrueValue();
    Value *f = instruction->getFalseValue();
    auto pairT = annotationStore->getAnnotation(t);
    auto pairF = annotationStore->getAnnotation(f);
    errs() << "\t";
    if (pairT.second) {
        errs() << "Got annotation for True value: " << pairT.first.tostr() << ". ";
    } else {
        errs() << "Failed to get annotation for " << t << ". ";
    }
    if (pairF.second) {
        errs() << "Got annotation for False value: " << pairF.first.tostr() << ". ";
    } else {
        errs() << "Failed to get annotation for " << f << ". ";
    }
    Annotation annoT = pairT.first;
    Annotation annoF = pairF.first;
    long max, min, prec;
    if(annoT.max > annoF.max) max = annoT.max; else max = annoF.max;
    if(annoT.min < annoF.min) min = annoT.min; else min = annoF.min;
    if(annoT.precision > annoF.precision) prec = annoT.precision; else prec = annoF.precision;
    errs() << "Saving annotation: (" << max << ", " << min << "," << prec << ")";
    annotationStore->addAnnotation(instruction, max, min, prec);
    Annotation annotation = annotationStore->getAnnotation(instruction).first;
    LLVMContext& C = instruction->getContext();
    MDNode* N = MDNode::get(C, MDString::get(C, annotation.tostr()));
    instruction->setMetadata("optimi", N);
    errs() << "\n";
}

void Optimi::handlePhi(AnnotationStore *annotationStore, PHINode *instruction) {
    errs() << "\t";
    unsigned number = instruction->getNumIncomingValues();
    unsigned i;
    long max, min, prec;
    max  = INT_MIN;
    min  = INT_MAX;
    prec = 0;
    for (i = 0; i < number; i++) {
        Value *v = instruction->getIncomingValue(i);
        auto pair = annotationStore->getAnnotation(v);
        if (pair.second) {
            Annotation anno = pair.first;
            if (max < anno.max) {max = anno.max;}
            if (min > anno.min) {min = anno.min;}
            if (prec < anno.precision) {prec = anno.precision;}
        } else {
            max  = INT_MIN;
            min  = INT_MAX;
            prec = 0;
            errs() << "Failed to get annotation for: " << v << ". ";
            break;
        }
    }
    errs() << "Saving annotation: (" << max << ", " << min << ", " << prec << ")";
    annotationStore->addAnnotation(instruction, max, min, prec);
    Annotation annotation = annotationStore->getAnnotation(instruction).first;
    LLVMContext& C = instruction->getContext();
    MDNode* N = MDNode::get(C, MDString::get(C, annotation.tostr()));
    instruction->setMetadata("optimi", N);
    errs() << "\n";
}

void Optimi::handleAdd(AnnotationStore* annotationStore, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
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
    errs() << "Saving annotation: (" << max << ", " << min << ",0)";
    annotationStore->addAnnotation(instruction, max, min, 0);
}

void Optimi::handleMul(AnnotationStore* annotationStore, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
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
    errs() << "Saving annotation: (" << max << ", " << min << ",0)";
    annotationStore->addAnnotation(instruction, max, min, 0);
}

void Optimi::handleSub(AnnotationStore* annotationStore, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
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
    errs() << "Saving annotation: (" << max << ", " << min << ",0)";
    annotationStore->addAnnotation(instruction, max, min, 0);
}

void Optimi::handleShl(AnnotationStore* annotationStore, BinaryOperator *instruction, Annotation anno0, Annotation anno1) {
    int max = anno0.max * 2;
    int min = anno0.min * 2;
    errs() << "Saving annotation: (" << max << ", " << min << ",0)" << "\n";
    annotationStore->addAnnotation(instruction, max, min, 0);
}

void Optimi::handleBinaryOperator(AnnotationStore* annotationStore, BinaryOperator *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction->getOperand(1);
    std::pair<Annotation, bool> pair0 = annotationStore->getAnnotation(op0);
    std::pair<Annotation, bool> pair1 = annotationStore->getAnnotation(op1);
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
            handleAdd(annotationStore, instruction, anno0, anno1);
            break;
        }
        case Instruction::Mul : {
            handleMul(annotationStore, instruction, anno0, anno1);
            break;
        }
        case Instruction::Sub : {
            handleSub(annotationStore, instruction, anno0, anno1);
            break;
        }
        case Instruction::Shl : {
            handleShl(annotationStore, instruction, anno0, anno1);
            break;
        }
        default: {
            errs() << "Unable to work out the annotation for the given opcode";
            annotationStore->addAnnotation(instruction, AnnotationStore::INT);
        }
    }
    Annotation annotation = annotationStore->getAnnotation(instruction).first;
    LLVMContext& C = instruction->getContext();
    MDNode* N = MDNode::get(C, MDString::get(C, annotation.tostr()));
    instruction->setMetadata("optimi", N);
    errs() << "\n";
}

void Optimi::handleBitCast(AnnotationStore* annotationStore, BitCastInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction;
    annotationStore->markEquivalent(op1, op0);
}

void Optimi::handleGetElementPtr(AnnotationStore *annotationStore, GetElementPtrInst *instruction)
{
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction;
    annotationStore->markEquivalent(op1, op0);
}

void Optimi::handleFunctionCall(AnnotationStore *annotationStore, CallInst *instruction)
{
    StringRef name = instruction->getCalledFunction()->getName();
    if (name == "llvm.var.annotation") { // if this is an annotation, then get the annotation string
        Value *variable = instruction->getOperand(0);
        Value *val = instruction->getArgOperand(1); // cast to a function call and get the second operand
        Value *us = cast<User>(*val).getOperand(0); // Get the pointer to the global where the annotation is stored
        StringRef anno = cast<ConstantDataArray>(cast<User>(*us).getOperand(0))->getAsCString(); // get the annotation as a string
        annotationStore->addAnnotation(anno, variable);
        Annotation anna = annotationStore->getAnnotation(variable).first;
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

    AnnotationStore localAnnotations;

    errs() << "Analysing function: " << F.getName() << "\n";
    for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        if (StoreInst *store = dyn_cast<StoreInst>(&*I)) {
            handleStore(&localAnnotations, store);
        } else if (LoadInst *load = dyn_cast<LoadInst>(&*I)) {
            handleLoad(&localAnnotations, load);
        } else if (GetElementPtrInst *elemAddr = dyn_cast<GetElementPtrInst>(&*I)) {
            handleGetElementPtr(&localAnnotations, elemAddr);
        } else if (BinaryOperator *binaryOperator = dyn_cast<BinaryOperator>(&*I)) {
            handleBinaryOperator(&localAnnotations, binaryOperator);
        } else if (BitCastInst *bitCast = dyn_cast<BitCastInst>(&*I)) {
            handleBitCast(&localAnnotations, bitCast);
        } else if (CallInst *call = dyn_cast<CallInst>(&*I)) {
            handleFunctionCall(&localAnnotations, call);
        } else if (SelectInst *select = dyn_cast<SelectInst>(&*I)) {
            handleSelect(&localAnnotations, select);
        } else if (PHINode *phi = dyn_cast<PHINode>(&*I)) {
            handlePhi(&localAnnotations, phi);
        }
    }
    errs() << "\n";
}

bool Optimi::runOnModule(Module &M)
{
    // Not needed at this time, may come back in the future

    // GlobalVariable *global_annos = M.getNamedGlobal("llvm.global.annotations");
    // if (global_annos) {
    //     ConstantArray *a = cast<ConstantArray>(global_annos->getOperand(0));
    //     for (int i=0; i < a->getNumOperands(); i++) {
    //         ConstantStruct *e = cast<ConstantStruct>(a->getOperand(i));
    //         Value* annoValue = e->getOperand(0)->getOperand(0);
    //         StringRef anno = cast<ConstantDataArray>(cast<GlobalVariable>(e->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
    //         addAnnotation(&this->globalAnnotations, anno, annoValue);
    //     }
    // }

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
