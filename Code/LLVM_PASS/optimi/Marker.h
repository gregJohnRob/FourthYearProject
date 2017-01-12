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
    void addAnnotation(Value *v, Annotation a);
    void addDependencyCounter(Value *v, DependencyCounter *dc);
    void cleanDependencies(Value *v);

    /// Functions for handling instructions
    void handle_load(LoadInst *instruction);
    void handle_store(StoreInst *instruction);
    void handle_select(SelectInst *instruction);
    void handle_phi(PHINode *instruction);
    void handle_binary_operator(BinaryOperator *instruction);
    void handle_bitcast(BitCastInst *instruction);
    void handle_trunc(TruncInst *instruction);
    void handle_getelementptr(GetElementPtrInst *instruction);
    void handle_call(CallInst *instruction);

    /// Extra handler methods
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

public:
    /// Functions for interacting with the Marker
    void analyseInstruction(Value *I);
    int finishMethodAnalysis();


};
}
#endif
