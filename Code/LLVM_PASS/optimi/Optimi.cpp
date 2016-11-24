#include <cmath>
#include <ctgmath>
#include <sstream>
#include <stdlib.h>
#include <unordered_map>

#include "llvm/Pass.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/User.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"


using namespace llvm;

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
// http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html
namespace
{

/**
 * Struct used to store the annotation information as it is stored
 * in the maps.
 * NOTE: A possible extension would be to create default annotations for Integers, Floats, Doubles, etc.
 */
struct Annotation {
    int max;
    int min;
    int precision;

    Annotation() {
        this->max = 0;
        this->min = 0;
        this->precision = 0;
    }

    Annotation(int max, int min, int precision) {
        this->max = max;
        this->min = min;
        this->precision = precision;
    }

    std::string tostr() {
        return "("+ std::to_string(this->max) + ", " + std::to_string(this->min) + ", " + std::to_string(this->precision) + ")";
    }
};

struct OptimiPass : public ModulePass {
    static char ID;
    ValueMap<Value*, Annotation> globalAnnotations;
    OptimiPass() : ModulePass(ID) {}

    /**
     * Adds an annotation to the GLOBAL annotations map
     *
     * @param The StringRef for the annotation. An annotation is
     *        expected to contain:
     *                   The name of the variable
     *                 The max value that the variable can take
     *                 The min value that the variable can take
     *                 The precision required of the variable
     *
     */
    static bool addAnnotation (ValueMap<Value*, Annotation> *annotationGroup, StringRef anno, Value* value)
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

    /*
     * Mark value one as equivalent to value two in the equivalents map
     */
    static void markEquivalent (std::vector<std::pair<Value *, Value *>> *equivalents, Value * v1, Value * v2)
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

    /*
     * Get the annotation for a given value. If the value does not have an annotation, check each of its equivalent values for a type.
     * This does have the potential for an infinite loop, something to program against later on.
     */
    static std::pair<Annotation, bool> getAnnotation (ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, Value *value) {
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
        return std::make_pair(Annotation(), false);
    }

    static void handleStore(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, StoreInst *instruction) {
        Value *op0 = instruction->getOperand(0);
        Value *op1 = instruction->getOperand(1);
        markEquivalent(equivalents, op0, op1);
    }

    static void handleLoad(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, LoadInst *instruction) {
        Value *op0 = instruction->getOperand(0);
        Value *op1 = instruction;
        markEquivalent(equivalents, op1, op0);
        errs() << op1 << "\n";
    }

    static void handleBinaryOperator(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, BinaryOperator *instruction) {
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
        annotationMap->insert(std::make_pair(instruction, Annotation()));
        errs() << "\n";
    }

    static void handleBitCast(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, BitCastInst *instruction) {
        Value *op0 = instruction->getOperand(0);
        Value *op1 = instruction;
        markEquivalent(equivalents, op1, op0);
    }

    /*
     * Basic implementation.
     * Currently checks for an annotation and will then adds the annotation to the annotationMap
     */
    static void handleFunctionCall(ValueMap<Value *, Annotation> *annotationMap, std::vector<std::pair<Value *, Value *>> *equivalents, CallInst *instruction) {
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
    /**
     * @param F the Function that will be passed over
     *
     *           Currently only goes through all of the instructions,
     *           checking if it is a call to llvm.var.annotation and
     *        then getting the annotation information from it.
     *
     */
    void functionPass(Function &F)
    {
        // if this is an llvm function then just return
        if (F.getName().find("llvm") != std::string::npos) {
            errs() << "Ignoring function: " << F.getName() << "\n";
            return;
        }

        ValueMap<Value *, Annotation> localAnnotations;
        std::vector<std::pair<Value *, Value *>> equivalents; // use this to sort what variables are equivalent to one another

        errs() << "Analysing function: " << F.getName() << "\n";
        for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
            if (StoreInst *store = dyn_cast<StoreInst>(&*I)) {
                handleStore(&localAnnotations, &equivalents, store);
            }
            else if (LoadInst *load = dyn_cast<LoadInst>(&*I)) {
                handleLoad(&localAnnotations, &equivalents, load);
            }
            else if (BinaryOperator *binaryOperator = dyn_cast<BinaryOperator>(&*I)) {
                handleBinaryOperator(&localAnnotations, &equivalents, binaryOperator);
            }
            else if (BitCastInst *bitCast = dyn_cast<BitCastInst>(&*I)) {
                handleBitCast(&localAnnotations, &equivalents, bitCast);
            }
            else if (CallInst *call = dyn_cast<CallInst>(&*I)) {
                handleFunctionCall(&localAnnotations, &equivalents, call);
            }
        }
    }

    /**
     *
     * @param M the Module that will be passed over
     *
     * Loop over all global annotations and extract them
     * For each function in the code
     *         If the function was created by LLVM
     *             skip it
     *         Create a new local annotation group for the Function
     *             For each Instruction in the Function
     *                 If the Instruction is a call to llvm
     *                     (This signals that it is the start or end of an annotation, or it is getting the annotation)
     *                 If the instruction is some form of asignment
     *                     work out the new values size based on the values used and type of asignment that it is
     */
    virtual bool runOnModule(Module &M)
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
};
}


/*
 * This is how the pass gets registered and will run
 */
char OptimiPass::ID = 0;
static RegisterPass<OptimiPass> X("passname", "Pass Name Analysis");
static void registerPass(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new OptimiPass());
}
static RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible, registerPass);
