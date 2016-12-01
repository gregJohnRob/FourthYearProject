//===-- optimi/Optimi.h - Optimi class definition -------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declaration of the Optimi class. This is a custom
/// llvm pass which uses variable annotations to provide helpful metadata when
/// compiling for FPGAs.
///
//===----------------------------------------------------------------------===//

#ifndef OPTIMI_H
#define OPTIMI_H

#include "Annotation.h"

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

#include <cmath>
#include <ctgmath>
#include <cstdint>
#include <sstream>
#include <stdlib.h>
#include <unordered_map>



using namespace llvm;

namespace optimi
{

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
// http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html

/// Extends ModulePass to add metadata to a program which can then be used to
/// help generate IR for an FPGA.
struct Optimi : public ModulePass
{
    static char ID;
    ValueMap<Value*, Annotation> globalAnnotations;
    Optimi() : ModulePass(ID) {}

    /// Constructs and adds an annotation to a given annotation group, linked to
    /// the given value
    static bool addAnnotation (
        ValueMap<Value*, Annotation> *annotationGroup,
        StringRef anno,
        Value* value);

    /// Marks two values as equivalent in terms of annotations
    static void markEquivalent (
        std::vector<std::pair<Value *, Value *>> *equivalents,
        Value * v1,
        Value * v2);

    /// Retrieves an annotation for a given value if it can.
    /// Output always contains an annotation, the boolean states whither or not
    /// an annotation could be found (true) or an annotation was made (false).
    static std::pair<Annotation, bool> getAnnotation (
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        Value *value);

    ////////////////////////////////////////////////////////////////////////////
    /// Handle different Instruction types
    ////////////////////////////////////////////////////////////////////////////

    static void handleStore(
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        StoreInst *instruction);

    static void handleLoad(
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        LoadInst *instruction);

    static void handleBinaryOperator(
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        BinaryOperator *instruction);

    static void handleBitCast(
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        BitCastInst *instruction);

    static void handleGetElementPtr(
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        GetElementPtrInst *instruction);

    static void handleFunctionCall(
        ValueMap<Value *, Annotation> *annotationMap,
        std::vector<std::pair<Value *, Value *>> *equivalents,
        CallInst *instruction);

    /// Generates the meta data for a given function
    void functionPass(Function &F);

    /// Generates the meta data for a given module
    virtual bool runOnModule(Module &M);
};
}
#endif
