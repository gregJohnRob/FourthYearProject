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
    void handleLoad(LoadInst *instruction);
    void handleStore(StoreInst *instruction);
    void handleSelect(SelectInst *instruction);
    void handlePhi(PHINode *instruction);
    void handleBinaryOperator(BinaryOperator *instruction);
    void handleBitCast(BitCastInst *instruction);
    void handleTrunc(TruncInst *instruction);
    void handleGetElementPtr(GetElementPtrInst *instruction);
    void handleFunctionCall(CallInst *instruction);

    /// Extra handler methods
    void handleAdd(Value *target, Annotation a0, Annotation a1);
    void handleMul(Value *target, Annotation a0, Annotation a1);
    void handleSub(Value *target, Annotation a0, Annotation a1);
    void saveNewAnnotation(Value *target, double range[4], int precision);

public:
    /// Functions for interacting with the Marker
    void analyseInstruction(Value *I);
    int finishMethodAnalysis();


};
}
#endif
