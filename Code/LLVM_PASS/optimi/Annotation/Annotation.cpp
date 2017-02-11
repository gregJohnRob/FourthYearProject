#include "Annotation.h"

using namespace llvm;
using namespace optimi;

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

Annotation::Annotation(double range[], int size, int precision)
{
    if (size < 1) {
        errs() << "Attempted to create an annotation with range 0\n";
        this->max = INT_MAX;
        this->min = INT_MIN;
        this->precision = 0;
        return;
    }
    this->max = this->min = range[0];
    for (int i = 1; i < 4; i++) {
        if (range[i] > this->max) {
            this->max = range[i];
        }
        if (range[i] < this->min) {
            this->min = range[i];
        }
    }
    this->precision = precision;
}

Annotation::Annotation(std::string ref)
{
    if (std::regex_match(ref, std::regex("((-?)([0123456789]+)((\\.[0123456789]+)?)) ((-?)([0123456789]+)((\\.[0123456789]+)?)) ([0123456789]+)"))) {
        std::stringstream stream(ref);
        stream >> this->max >> this->min >> this->precision;
    } else {
        errs() << "Invalid Annotation " << ref << "\n";
        this->max = INT_MAX;
        this->min = INT_MIN;
        this->precision = 0;
    }
    return;
}

std::string Annotation::str()
{
    std::stringstream ss;
    ss << "(" << this->max << ", ";
    ss << this->min << ", ";
    ss << this->precision << ")";
    return ss.str();
}
