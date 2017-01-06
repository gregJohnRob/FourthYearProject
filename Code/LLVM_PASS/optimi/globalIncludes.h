//===-- optimi/globalIncludes.h - Annotation class definition -------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the includes from llvm and standard libraries which are
/// used throughout the codebase.
///
//===----------------------------------------------------------------------===//

#ifndef GLOBAL_INCLUDES_H
#define GLOBAL_INCLUDES_H

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

#endif
