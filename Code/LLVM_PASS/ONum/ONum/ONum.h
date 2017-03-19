//===-- ONum/ONum/ONum.h - ONum class definition -------*- C++ -*-===//
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

#ifndef ONUM_H
#define ONUM_H

#include "../Annotation/Annotation.h"
#include "../DependencyCounter/DependencyCounter.h"
#include "../Marker/Marker.h"

#include "../globalIncludes.h"

using namespace llvm;

namespace optimus_numerum
{

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
// http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html

/// Extends ModulePass to add metadata to a program which can then be used to
/// help generate IR for an FPGA.
struct ONum : public ModulePass {
    static char ID;
    ValueMap<Value *, Annotation> globalAnnotationMap;
    //ValueMap<Value*, Annotation> globalAnnotations;
    ONum() : ModulePass(ID) {}

    int analyseFunction(Function &F);

    /// Generates the meta data for a given module
    virtual bool runOnModule(Module &M);
};
}
#endif
