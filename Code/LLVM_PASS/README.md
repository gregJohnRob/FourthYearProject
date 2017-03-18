An LLVM Pass for applying metadata to each instruction.

Initial code taken from https://github.com/sampsyo/llvm-pass-skeleton.

Build:
    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ cd ..

Run:

    $ clang -S -emit-llvm -Xclang -load -Xclang ../LLVM_PASS/build/ONum/libONumPass.* something.c
