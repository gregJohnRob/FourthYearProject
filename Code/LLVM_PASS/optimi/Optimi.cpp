#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include <stdlib.h>
#include "llvm/IR/Constants.h"
#include "llvm/IR/User.h"
using namespace llvm;

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
// http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html
namespace {
    struct OptimiPass : public ModulePass {
        static char ID;
        OptimiPass() : ModulePass(ID) {}

        virtual bool runOnModule(Module &M) {
			// get all global variables with the name "llvm.global.annotations"
            GlobalVariable *global_annos = M.getNamedGlobal("llvm.global.annotations");
            // if there was any then loop over all of them and print out the annotation
            if (global_annos) {
              ConstantArray *a = cast<ConstantArray>(global_annos->getOperand(0));
              for (int i=0; i<a->getNumOperands(); i++) {
                ConstantStruct *e = cast<ConstantStruct>(a->getOperand(i));
                StringRef anno = cast<ConstantDataArray>(cast<GlobalVariable>(e->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
                errs() << anno;
              }
            }

			// loop over all functions and apply the changes
            for (auto curFref = M.begin(), endFref = M.end(); curFref != endFref; ++curFref) {
                errs() << "found function: " << curFref->getName() << "\n";
            }
            return false;
        }
    };
}

char OptimiPass::ID = 0;
static RegisterPass<OptimiPass> X("passname", "Pass Name Analysis");
static void registerPass(const PassManagerBuilder &, legacy::PassManagerBase &PM) {
	PM.add(new OptimiPass());
}
static RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible, registerPass);
