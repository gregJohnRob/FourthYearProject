//===-- ONum/DependencyCounter/DependencyCounter.h - DependencyCounter class definition -------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------------------===//
///
/// \file
/// This file contains the declaration of the DependencyCounter struct.  This is used in
/// order to monitor when an instruction is ready to be analysed by the Marker by keeping
/// track of the number of unfulfilled dependencies of the instruction.
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
