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

#ifndef MARKER_H
#define MARKER_H

#include "Annotation.h"
#include "DependencyCounter.h"

#include "globalIncludes.h"

using namespace llvm;

namespace optimi
{

class Marker
{ 

    ValueMap<Value *, std::vector<DependencyCounter *>> dependencyMap;
    std::vector<DependencyCounter *> dependencyVector;
    ValueMap<Value *, Annotation> annotationMap;

    /// Functions for handling the dependencyMap, dependencyVector and annotationMap
    bool hasAnnotation(Value *v);
    Annotation getAnnotation(Value *v);
    void addDependencyCounter(Value *v, DependencyCounter *dc);
    void cleanDependencies(Value *v);

    /// Functions for handling instructions
    void handle_load(LoadInst *instruction);
    void handle_store(StoreInst *instruction);
    void handle_select(SelectInst *instruction);
    void handle_phi(PHINode *instruction);
    void handle_binary_operator(BinaryOperator *instruction);
    void handle_cast(CastInst *instruction);
    void handle_trunc(TruncInst *instruction);
    void handle_getelementptr(GetElementPtrInst *instruction);
    void handle_call(CallInst *instruction);
    void handle_cmp(CmpInst *instruction);

    /// Methods for handling Binary Operations
    void handle_add(Value *target, Annotation a0, Annotation a1);
    void handle_mul(Value *target, Annotation a0, Annotation a1);
    void handle_sub(Value *target, Annotation a0, Annotation a1);
    void handle_udiv(Value *target, Annotation a0, Annotation a1);
    void handle_sdiv(Value *target, Annotation a0, Annotation a1);
    void handle_fdiv(Value *target, Annotation a0, Annotation a1);
    void handle_urem(Value *target, Annotation a0, Annotation a1);
    void handle_srem(Value *target, Annotation a0, Annotation a1);
    void handle_frem(Value *target, Annotation a0, Annotation a1);
    void saveNewAnnotation(Value *target, double range[4], int precision);

    /// Methods for handling Bitwise Operations
    void handle_shl(Value *target, Annotation a0, Annotation a1);
    void handle_lshr(Value *target, Annotation a0, Annotation a1);
    void handle_ashr(Value *target, Annotation a0, Annotation a1);
    void handle_and(Value *target, Annotation a0, Annotation a1);
    void handle_or(Value *target, Annotation a0, Annotation a1);
    void handle_xor(Value *target, Annotation a0, Annotation a1);

    /*
        There are several subtypes of the cast instruction. At the moment these
        are all handled in the same way, however it may be better in future to
        handle them separately.
    */

    /*
        There are several functions which llvm implements for us (for example log).
        These functions are not currently handled but it may be worth implementing
        handlers for these functions.
    */

public:
    /// Functions for interacting with the Marker
    Marker();
    void addAnnotation(Value *v, Annotation a);
    void analyseInstruction(Value *I);
    int finishMethodAnalysis();
};
}
#endif
