//===-- ONum/Annotation/Annotation.h - Annotation class definition -------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declaration of the Annotation struct.  This is used
/// in order to store the range and precision of Values within the program.
///
//===----------------------------------------------------------------------===//

#ifndef ANNOTATION_H
#define ANNOTATION_H

#include "../globalIncludes.h"

using namespace llvm;

namespace optimus_numerum
{

struct Annotation {

    double max;
    double min;
    int precision;

    Annotation(double range[], int size, int precision);
    Annotation(double max, double min, int precision);
    Annotation();
    Annotation(std::string ref);

    std::string str();
};
}

#endif
