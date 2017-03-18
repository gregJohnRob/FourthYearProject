#include "Marker.h"

using namespace llvm;
using namespace optimus_numerum;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Terminator Instruction Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_ret(ReturnInst *instruction) {
    Value *v = instruction->getReturnValue();
    if (!v) {
        // function must return null
        return;
    }
    Annotation a, f;
    
    if (this->hasAnnotation(v) && this->hasAnnotation(this->F)) {
        a = this->getAnnotation(v);
        f = this->getAnnotation(this->F);
        if (a.max != f.max || a.min != f.min || a.precision != f.precision) {
            errs() << "\t" << "The annotation given to this function, is different to the annotation which was calculated\n";
            errs() << "\t" << "Given annotation: " << f.str() << ", Calculated annotation: " << a.str() << "\n";
        }
    }
}
