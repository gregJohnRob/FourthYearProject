# builds the program and runs the code.
# http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
eval "clang -c  -emit-llvm  "$1".c   -o "$1".bc"
eval "opt   -load ../LLVM_PASS/build/optimi/libOptimiPass.so -passname "$1".bc -S -o "$1".ll"
