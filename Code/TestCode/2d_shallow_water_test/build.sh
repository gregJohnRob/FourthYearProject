clang -c -O1 -emit-llvm  host.c host-generic.c host-sw2d.c

opt   -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname host.bc -S -o host.ll
opt   -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname host-generic.bc -S -o host-generic.ll
opt   -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname host-sw2d.bc -S -o host-sw2d.ll
