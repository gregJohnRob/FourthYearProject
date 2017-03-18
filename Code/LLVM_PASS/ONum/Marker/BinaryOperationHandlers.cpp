#include "Marker.h"

using namespace llvm;
using namespace optimus_numerum;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Binary Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_binary_operator(BinaryOperator *instruction)
{
    if (this->hasAnnotation(instruction)) {
        return;
    }
    Value *op0 = instruction->getOperand(0);
    Value *op1 = instruction->getOperand(1);
    Annotation a0, a1;
    Value *target = instruction;
    DependencyCounter *d = new DependencyCounter();
    d->instruction = instruction;
    if (this->hasAnnotation(op0)) {
        a0 = this->getAnnotation(op0);
    } else {
        d->numOfDependencies++;
        this->addDependencyCounter(op0, d);
    }
    if (this->hasAnnotation(op1)) {
        a1 = this->getAnnotation(op1);
    } else {
        d->numOfDependencies++;
        this->addDependencyCounter(op1, d);
    }
    if (d->numOfDependencies == 0) {
        switch (instruction->getOpcode()) {
        case Instruction::FAdd :
        case Instruction::Add  : {
            this->handle_add(target, a0, a1);
            break;
        }
        case Instruction::FSub :
        case Instruction::Sub  : {
            this->handle_sub(target, a0, a1);
            break;
        }
        case Instruction::FMul :
        case Instruction::Mul  : {
            this->handle_mul(target, a0, a1);
            break;
        }
        case Instruction::UDiv  : {
            this->handle_udiv(target, a0, a1);
            break;
        }
        case Instruction::SDiv  : {
            this->handle_sdiv(target, a0, a1);
            break;
        }
        case Instruction::FDiv  : {
            this->handle_fdiv(target, a0, a1);
            break;
        }
        case Instruction::URem  : {
            this->handle_urem(target, a0, a1);
            break;
        }
        case Instruction::SRem  : {
            this->handle_srem(target, a0, a1);
            break;
        }
        case Instruction::FRem  : {
            this->handle_frem(target, a0, a1);
            break;
        }
        // Bit wise operations
        case Instruction::Shl  : {
            this->handle_shl(target, a0, a1);
            break;
        }
        case Instruction::LShr : {
            this->handle_lshr(target, a0, a1);
            break;
        }
        case Instruction::AShr : {
            this->handle_ashr(target, a0, a1);
            break;
        }
        case Instruction::And  : {
            this->handle_and(target, a0, a1);
            break;
        }
        case Instruction::Or   : {
            this->handle_or(target, a0, a1);
            break;
        }
        case Instruction::Xor  : {
            this->handle_xor(target, a0, a1);
            break;
        }
        default: {
            errs() << "Unable to work out the annotation for the given opcode";
            this->addAnnotation(target, WORST_CASE_INT);
        }
        }
    }
}

void Marker::handle_add(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max + a1.max,
        a0.max + a1.min,
        a0.min + a1.max,
        a0.min + a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_mul(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max * a1.max,
        a0.max * a1.min,
        a0.min * a1.max,
        a0.min * a1.min
    };
    int precision = a0.precision + a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_sub(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        a0.max - a1.max,
        a0.max - a1.min,
        a0.min - a1.max,
        a0.min - a1.min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_udiv(Value *target, Annotation a0, Annotation a1)
{
    double a1max = a1.max;
    double a1min = a1.min;
    bool divByZero = false;
    if (a1.max == 0) {
        divByZero = true;
        a1max = -1 * pow(10, -a1.precision);
    }
    if (a1.min == 0) {
        divByZero = true;
        a1min = 1 * pow(10, -a1.precision);
    }
    if (divByZero) {
        errs() << "\tPossible division by 0\n";
    }
    double range[4] = {
        std::abs(a0.max / a1max),
        std::abs(a0.max / a1min),
        std::abs(a0.min / a1max),
        std::abs(a0.min / a1min)
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    //errs() << "\t\t" << target->getName().str() << " ";
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_sdiv(Value *target, Annotation a0, Annotation a1)
{
    double a1max = a1.max;
    double a1min = a1.min;
    bool divByZero = false;
    if (a1.max == 0) {
        divByZero = true;
        a1max = -1 * pow(10, -a1.precision);
    }
    if (a1.min == 0) {
        divByZero = true;
        a1min = 1 * pow(10, -a1.precision);
    }
    if (divByZero) {
        errs() << "\tPossible division by 0\n";
    }
    double range[4] = {
        a0.max / a1max,
        a0.max / a1min,
        a0.min / a1max,
        a0.min / a1min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    //errs() << "\t\t" << target->getName().str() << " ";
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_fdiv(Value *target, Annotation a0, Annotation a1)
{
    double a1max = a1.max;
    double a1min = a1.min;
    bool divByZero = false;
    if (a1.max == 0) {
        divByZero = true;
        a1max = -1 * pow(10, -a1.precision);
    }
    if (a1.min == 0) {
        divByZero = true;
        a1min = 1 * pow(10, -a1.precision);
    }
    if (divByZero) {
        errs() << "\tPossible division by 0\n";
    }
    double range[4] = {
        a0.max / a1max,
        a0.max / a1min,
        a0.min / a1max,
        a0.min / a1min
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    //errs() << "\t\t" << target->getName().str() << " ";
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_urem(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        std::abs(fmod(a0.max, a1.max)),
        std::abs(fmod(a0.max, a1.min)),
        std::abs(fmod(a0.min, a1.max)),
        std::abs(fmod(a0.min, a1.min))
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_srem(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        fmod(a0.max, a1.max),
        fmod(a0.max, a1.min),
        fmod(a0.min, a1.max),
        fmod(a0.min, a1.min)
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}

void Marker::handle_frem(Value *target, Annotation a0, Annotation a1)
{
    double range[4] = {
        fmod(a0.max, a1.max),
        fmod(a0.max, a1.min),
        fmod(a0.min, a1.max),
        fmod(a0.min, a1.min)
    };
    int precision = (a0.precision > a1.precision) ? a0.precision : a1.precision;
    this->handleAnnotation(target, Annotation(range, 4, precision));
}
