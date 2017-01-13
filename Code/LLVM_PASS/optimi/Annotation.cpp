#include "Annotation.h"

using namespace llvm;
using namespace optimi;

/**
 * Struct used to store the annotation information as it is stored
 * in the maps.
 * NOTE: A possible extension would be to create default annotations for Integers, Floats, Doubles, etc.
 */


Annotation::Annotation()
{
    this->max = this->min = this->precision = 0;
}

Annotation::Annotation(double max, double min, int precision)
{
    this->max = max;
    this->min = min;
    this->precision = precision;
}

Annotation::Annotation(std::string ref)
{
    std::string st = ref;
    std::stringstream stream(st);
    double max, min;
    int prec;
    stream >> max;
    if (stream.fail()) {
        stream.clear();
        errs() << "Invalid annotation: " << ref << "\n";
        this->max = INT_MAX;
        this->min = INT_MIN;
        this->precision = 0;
        return;
    }
    stream >> min;
    if (stream.fail()) {
        stream.clear();
        errs() << "Invalid annotation: " << ref << "\n";
        this->max = INT_MAX;
        this->min = INT_MIN;
        this->precision = 0;
        return;
    }
    stream >> prec;
    if (stream.fail()) {
        stream.clear();
        errs() << "Invalid annotation: " << ref << "\n";
        this->max = INT_MAX;
        this->min = INT_MIN;
        this->precision = 0;
        return;
    }
    this->max = max;
    this->min = min;
    this->precision = prec;
}

std::string Annotation::str()
{
    std::stringstream ss;
    ss << "(" << this->max << ", ";
    ss << this->min << ", ";
    ss << this->precision << ")";
    return ss.str();
}
