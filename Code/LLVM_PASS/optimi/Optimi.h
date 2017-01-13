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
#include "DependencyCounter.h"
#include "Marker.h"

#include "globalIncludes.h"

using namespace llvm;

namespace optimi
{

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
// http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html

/// Extends ModulePass to add metadata to a program which can then be used to
/// help generate IR for an FPGA.
struct Optimi : public ModulePass {
    static char ID;
    ValueMap<Value *, Annotation> globalAnnotationMap;
    //ValueMap<Value*, Annotation> globalAnnotations;
    Optimi() : ModulePass(ID) {}

    int analyseFunction(Function &F);

    /// Generates the meta data for a given module
    virtual bool runOnModule(Module &M);
};
}
#endif
