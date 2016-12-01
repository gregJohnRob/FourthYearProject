#include "Annotation.h"

using namespace llvm;
using namespace optimi;

/**
 * Struct used to store the annotation information as it is stored
 * in the maps.
 * NOTE: A possible extension would be to create default annotations for Integers, Floats, Doubles, etc.
 */

const std::string Annotation::INT = "INT";

Annotation::Annotation(std::string type)
{
    if (type == Annotation::INT) {
        this->max = INT_MAX;
        this->min = INT_MIN;
        this->precision = 0;
    } else {
        this->max = 0;
        this->min = 0;
        this->precision = 0;
    }
}

Annotation::Annotation(long max, long min, long precision)
{
    this->max = max;
    this->min = min;
    this->precision = precision;
}

std::string Annotation::tostr()
{
    std::stringstream ss;
    ss << "(" << this->max << ", ";
    ss << this->min << ", ";
    ss << this->precision << ")";
    return ss.str();
}
