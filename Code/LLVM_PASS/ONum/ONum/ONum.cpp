#include "ONum.h"

using namespace llvm;
using namespace optimus_numerum;

int ONum::analyseFunction(Function &F)
{
    errs() << F.getName() << "\n";
    if (F.getName().find("llvm") != std::string::npos) {
        return 0;
    }
    Marker marker;
    marker.setFunction(&F);
    for (auto i = this->globalAnnotationMap.begin(), end = this->globalAnnotationMap.end(); i != end; i++) {
        marker.addAnnotation(i->first, i->second);
    }
    for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        marker.analyseInstruction(&*I);
    }
    return marker.finishMethodAnalysis();
}

bool ONum::runOnModule(Module &M)
{
    GlobalVariable *global_annos = M.getNamedGlobal("llvm.global.annotations");
    if (global_annos) {
        ConstantArray *a = cast<ConstantArray>(global_annos->getOperand(0));
        for (int i=0; i<a->getNumOperands(); i++) {
            ConstantStruct *e = cast<ConstantStruct>(a->getOperand(i));
            Value* annoValue = e->getOperand(0)->getOperand(0);
            StringRef anno = cast<ConstantDataArray>(cast<GlobalVariable>(e->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
            this->globalAnnotationMap.insert(std::make_pair(annoValue, Annotation(anno.str())));
        }
    }
    for (Module::iterator curFunc = M.begin(), endFunc = M.end(); curFunc != endFunc; ++curFunc) {
        int result = this->analyseFunction(*curFunc);
        errs() << "\t";
        switch (result) {
        case -1:
            errs() << "Unable to fully mark\n";
            break;
        case 0:
            errs() << "Ignoring\n";
            break;
        case 1:
            errs() << "Fully marked\n";
            break;
        default:
            errs() << "An error occurred while analysing\n";
            break;
        }
    }
    errs() << "\n";
    return false;
}

/*
 * This is how the pass gets registered and will run
 */
char ONum::ID = 0;
RegisterPass<ONum> X("passname", "Pass Name Analysis");
void registerPass(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new ONum());
}
RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible, registerPass);
