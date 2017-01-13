# builds the program and runs the code.
# http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
eval "clang -c -O1 -emit-llvm  "$1".c   -o "$1".bc"
eval "opt   -load ../LLVM_PASS/build/optimi/libOptimiPass.so -passname "$1".bc -S -o "$1".ll"


# If you were going to run the pass on multiple functions (for example kernal.c and main.c), then run the commands below
# clang -c -O1 -emit-llvm  main.c kernal.c
# opt -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname main.bc -S -o main.ll
