#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Memory Access and Addressing Operation Handlers
///////////////////////////////////////////////////////////////////////////////////////////////////

void Marker::handle_store(StoreInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction->getOperand(1);
    this->markEquivalent(v1, v2, instruction);

}

void Marker::handle_load(LoadInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}

void Marker::handle_getelementptr(GetElementPtrInst *instruction)
{
    Value *v1 = instruction->getOperand(0);
    Value *v2 = instruction;
    this->markEquivalent(v1, v2, instruction);
}
