#include "Marker.h"

using namespace llvm;
using namespace optimus_numerum;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Conversion Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_cast(CastInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}

void Marker::handle_trunc(TruncInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}
