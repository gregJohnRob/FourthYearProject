#include "DependencyCounter.h"

using namespace llvm;
using namespace optimi;

DependencyCounter::DependencyCounter(Value *instruction, unsigned numOfDependencies) {
    this->instruction = instruction;
    this->numOfDependencies = numOfDependencies;
}

DependencyCounter::DependencyCounter() {
    this->numOfDependencies = 0;
}
