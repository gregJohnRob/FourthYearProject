//===-- optimi/Annotation.h - Annotation class definition -------*- C++ -*-===//
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

#ifndef ANNOTATION_H
#define ANNOTATION_H

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
/**
 * Struct used to store the annotation information as it is stored
 * in the maps.
 * NOTE: A possible extension would be to create default annotations for Integers, Floats, Doubles, etc.
 */
struct Annotation {
    long max;
    long min;
    long precision;

    Annotation(std::string);

    Annotation(long max, long min, long precision);

    std::string tostr();
};
}

#endif
