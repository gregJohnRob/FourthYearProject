#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Terminator Instruction Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_ret(ReturnInst *instruction) {
    Value *v = instruction->getReturnValue();
    Annotation a, f;
    if (this->hasAnnotation(v) && this->hasAnnotation(this->F)) {
        a = this->getAnnotation(v);
        f = this->getAnnotation(F);
        if (a.max != f.max || a.min != f.min || a.precision != f.precision) {
            errs() << "This function has a booboo\n";
        }
    }
}
