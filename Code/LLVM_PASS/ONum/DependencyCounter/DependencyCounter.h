//===-- ONum/Annotation.h - Annotation class definition -------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declaration of the ONum class. This is a custom
/// llvm pass which uses variable annotations to provide helpful metadata when
/// compiling for FPGAs.
///
//===----------------------------------------------------------------------===//

#ifndef DEPENDENCY_COUNTER_H
#define DEPENDENCY_COUNTER_H

#include "../globalIncludes.h"

using namespace llvm;

namespace optimus_numerum
{

struct DependencyCounter {

    Value *instruction;
    unsigned numOfDependencies;

    DependencyCounter(Value *instruction, unsigned numOfDependencies);
    DependencyCounter();

};
}

#endif
