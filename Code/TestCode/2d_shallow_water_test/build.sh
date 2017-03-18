clang -c -emit-llvm -O2  host.c host-generic.c host-sw2d.c
#echo "host.ll"
#opt   -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname host.bc -S -o host.ll
#echo "host-generic"
#opt   -load ../../LLVM_PASS/build/optimi/libOptimiPass.so -passname host-generic.bc -S -o host-generic.ll
echo "host-sw2d"
opt   -load ../../LLVM_PASS/build/ONum/libONumPass.so -passname host-sw2d.bc -S -o host-sw2d.ll
#opt   host-sw2d.bc -S -o host-sw2d.ll
