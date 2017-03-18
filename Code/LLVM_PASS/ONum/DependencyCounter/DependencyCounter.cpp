#include "DependencyCounter.h"

using namespace llvm;
using namespace optimus_numerum;

DependencyCounter::DependencyCounter(Value *instruction, unsigned numOfDependencies)
{
    this->instruction = instruction;
    this->numOfDependencies = numOfDependencies;
}

DependencyCounter::DependencyCounter()
{
    this->numOfDependencies = 0;
}
