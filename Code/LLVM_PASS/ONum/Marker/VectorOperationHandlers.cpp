#include "Marker.h"

using namespace llvm;
using namespace optimus_numerum;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Vector Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////
void Marker::handle_insertelement(InsertElementInst *instruction) {
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction->getOperand(1);
    this->markEquivalent(v1, v2, instruction);
    this->markEquivalent(instruction, v1, instruction);
}


void Marker::handle_shufflevector(ShuffleVectorInst *instruction) {
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction->getOperand(1);
    Annotation anno1, anno2;
    DependencyCounter *dc = new DependencyCounter();
    dc->instruction = instruction;
    if (this->hasAnnotation(v1)) {
        anno1 = this->getAnnotation(v1);
    } else {
        dc->numOfDependencies++;
        this->addDependencyCounter(v1, dc);
    }
    if (this->hasAnnotation(v2)) {
        anno2 = this->getAnnotation(v2);
    } else {
        dc->numOfDependencies++;
        this->addDependencyCounter(v2, dc);
    }
    if (dc->numOfDependencies == 0) {
        delete dc;
        Annotation newAnno = Annotation(
            ((anno1.max > anno2.max) ? anno1.max : anno2.max),
            ((anno1.min > anno2.min) ? anno1.min : anno2.min),
            ((anno1.precision > anno2.precision) ? anno1.precision : anno2.precision)
        );
        this->addAnnotation(instruction, newAnno);
        this->cleanDependencies(instruction);
    }
}

void Marker::handle_extractelement(ExtractElementInst * instruction) {
    Value *v1 = instruction->getOperand(0);
    this->markEquivalent(instruction, v1, instruction);
}
