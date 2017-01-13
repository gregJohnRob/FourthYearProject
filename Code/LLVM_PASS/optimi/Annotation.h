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

#include "globalIncludes.h"

using namespace llvm;

namespace optimi
{
/**
 * Struct used to store the annotation information as it is stored
 * in the maps.
 * NOTE: A possible extension would be to create default annotations for Integers, Floats, Doubles, etc.
 */

struct Annotation {

    double max;
    double min;
    int precision;

    Annotation(double max, double min, int precision);
    Annotation();
    Annotation(std::string ref);

    std::string str();
};
}

#endif
