#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
using namespace llvm;

namespace {
    struct OptimiPass : public FunctionPass {
        static char ID;
        OptimiPass() : FunctionPass(ID) {}

        virtual bool runOnFunction(Function &F) {
            for (Function::iterator bb = F.begin(), Fe = F.end(); bb != Fe; ++bb) {
                int j = 0;
                char* data[] = {"hello", "world"};
                for (BasicBlock::iterator i = bb->begin(), bbe = bb->end(); i != bbe; ++i) {
                    LLVMContext& C = i->getContext();
                    MDNode* N = MDNode::get(C, MDString::get(C, data[j%2]));
                    i->setMetadata("optimi", N);
                    j++;
                }
            }
            return false;
        }
    };
}

char OptimiPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerOptimiPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) {
  PM.add(new OptimiPass());
}
static RegisterStandardPasses
  RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
registerOptimiPass);
