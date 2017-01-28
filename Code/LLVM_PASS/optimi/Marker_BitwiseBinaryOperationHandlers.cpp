#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Bitwise Binary Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_shl(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max * pow(2, a1.max),
        a0.max * pow(2, a1.min),
        a0.min * pow(2, a1.max),
        a0.min * pow(2, a1.min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_ashr(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max / pow(2, a1.max),
        a0.max / pow(2, a1.min),
        a0.min / pow(2, a1.max),
        a0.min / pow(2, a1.min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_lshr(Value *target, Annotation a0, Annotation a1)
{
    unsigned int a0max = ceil(a0.max);
    unsigned int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max >> a1max),
        double(a0max >> a1min),
        double(a0min >> a1max),
        double(a0min >> a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_and(Value *target, Annotation a0, Annotation a1)
{
    int a0max = ceil(a0.max);
    int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max & a1max),
        double(a0max & a1min),
        double(a0min & a1max),
        double(a0min & a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_or(Value *target, Annotation a0, Annotation a1)
{
    int a0max = ceil(a0.max);
    int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max | a1max),
        double(a0max | a1min),
        double(a0min | a1max),
        double(a0min | a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));;
}

void Marker::handle_xor(Value *target, Annotation a0, Annotation a1)
{
    int a0max = ceil(a0.max);
    int a0min = ceil(a0.min);
    int a1max = ceil(a1.max);
    int a1min = ceil(a1.min);
    double range[4] = {
        double(a0max ^ a1max),
        double(a0max ^ a1min),
        double(a0min ^ a1max),
        double(a0min ^ a1min)
    };
    int precision = a0.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}
