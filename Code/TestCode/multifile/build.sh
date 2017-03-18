clang -c -O1 -emit-llvm  host.c kernal.c

opt   -load ../../LLVM_PASS/build/ONum/libONumPass.so -passname host.bc -S -o host.ll
opt   -load ../../LLVM_PASS/build/ONum/libONumPass.so -passname kernal.bc -S -o kernal.ll
