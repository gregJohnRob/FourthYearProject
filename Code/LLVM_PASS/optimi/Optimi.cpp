#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
using namespace llvm;

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list

namespace {
    struct OptimiPass : public ModulePass {
        static char ID;
        OptimiPass() : ModulePass(ID) {}

        virtual bool runOnModule(Module &M) {
            for (auto curFref = M.begin(), 
                      endFref = M.end(); 
                      curFref != endFref; ++curFref) {
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
