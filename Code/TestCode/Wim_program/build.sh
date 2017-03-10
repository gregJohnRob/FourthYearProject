clang -c -emit-llvm -O2 main-unannotated_noDouble.c
# opt temp.bc -S -o temp.ll
# opt   -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname main-unannotated_noDouble.bc -S -o main-unannotated_noDouble.ll
opt main-unannotated_noDouble.bc -S -o main-unannotated_noDouble.ll
