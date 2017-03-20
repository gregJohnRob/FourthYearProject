# Optimus Numerum

Advisors: Dr Wim Vanderbauwhede and Dr Syed Waqar Nabi

### About

By making use of the "annotate" attribute, it is possible to mark variables with its required range and precision. Optimus Numerum (ONum) uses these annotations in order to mark intermediate instructions in the LLVM-IR code with their required range and precision. In doing so, it is possible to use this information to optimise the code for use on FPGAs, where it is advantageous to only use the minimum required bit widths.

This project was done in colaboration with the TyTra project (http://tytra.org.uk/).


### Layout

The Code folder contains all of the source code for the project. The LLVM_PASS folder contains the source code of ONum, and TestCode contains all of the sample programs used during the project. Reporting contains all of the reports send during the project. comparison_for_report contains the results in Latex of running the ONum pass over the 2D Shallow Water Kernel before converting it to TyTra-IR and running the TyTra cost model.

### Building

In order to build ONum, you first have to create a folder where you will store the build of the project. From there, cd into the folder and run cmake on the LLVM_PASS directory. Then run make on the results of running cmake.

This project assumes that LLVM, Clang, CMake and Make are installed on your machine.

### Running

To run the program, annotate your source code similar to that shown in the TestCode folder. Then run the following commands:

    clang -c -emit-llvm $@
    opt -load <path_to_pass>/optimi/libOptimiPass.so -passname $1.bc -S -o $1.ll

Where $@ represents all of your file names, and $1 represents the source file you wish to analyse.
