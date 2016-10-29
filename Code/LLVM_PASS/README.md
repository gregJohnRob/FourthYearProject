An LLVM Pass for applying metadata to each instruction.

Initial code taken from https://github.com/sampsyo/llvm-pass-skeleton.

Build: 
    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ cd ..

Run:

    $ clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.* something.c
