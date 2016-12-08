//===-- optimi/AnnotationStore.h - AnnotationStore class definition -------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declaration of the AnnotationStore class. This class
/// is used to link llvm::Value pointers to Optimi::Annotation's.
///
//===----------------------------------------------------------------------===//

#ifndef ANNOTATION_STORE_H
#define ANNOTATION_STORE_H

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
#include <unordered_set>

using namespace llvm;


namespace optimi
{
    typedef ValueMap<Value *, Annotation> AnnotationMap;
    typedef std::vector<std::pair<Value *, Value *>> Equivalents;

    struct AnnotationStore {
        /// Strings used to construct default Annotation objects
        static const unsigned INT;

        // Could add in an error code store

        AnnotationMap annotationMap;
        Equivalents equivalents;
        /// All addAnnotation functions return a boolean to say whither they were
        /// successful in adding a new value

        // Add an annotation given a StringRef and the value it relates to
        bool addAnnotation(StringRef anno, Value *value);
        bool addAnnotation(Value *value, long max, long min, long precision);
        bool addAnnotation(Value *value, unsigned);

        void markEquivalent(Value *v1, Value *v2);

        std::pair<Annotation, bool> getAnnotation(Value *value);
    };
}

#endif
