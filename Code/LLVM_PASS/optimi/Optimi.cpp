#include <stdlib.h>
#include <unordered_map>
#include <sstream>
#include <cmath> 
#include <ctgmath>

#include "llvm/Pass.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/User.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"


using namespace llvm;

// Basic structure was taken from: https://github.com/sampsyo/llvm-pass-skeleton
// Extra information about how to make a module pass run taken from: http://stackoverflow.com/questions/36308903/llvm-pass-error-when-iterating-over-module-functions-list
// http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html
namespace 
{
	
	/**
	 * Struct used to store the annotation information as it is stored 
	 * in the unordered_maps. 
	 */
	struct Annotation
	{
		int max;
		int min;
		int precision;
		int totalNumberOfBitsRequired;
		
		Annotation(int max, int min, int precision) 
		{
			this->max = max;
			this->min = min;
			this->precision = precision;
			if (abs(max) > abs(min)) {
				this->totalNumberOfBitsRequired = (int)log2(max)+1;
			} else {
				this->totalNumberOfBitsRequired = (int)log2(min)+1;
			}
		}
	};
	
    struct OptimiPass : public ModulePass 
	{
        static char ID;
        std::unordered_map<std::string, Annotation> annotations;
        OptimiPass() : ModulePass(ID) {}
        
        /**
         * Adds an annotation to the GLOBAL annotations map
         * 
         * @param The StringRef for the annotation. An annotation is 
         *        expected to contain:
         * 			  	The name of the variable
         * 				The max value that the variable can take
         * 				The min value that the variable can take
         * 				The precision required of the variable
         * 
         */
        void addAnnotation(std::unordered_map<std::string, Annotation> annotationGroup, StringRef anno) 
        {
			std::string annoString = anno.str();
			std::stringstream stream(annoString);
			int max, min, prec;
			std::string varName;
			stream >> varName;
			if (stream.fail()) {
				stream.clear();
				errs() << "Invalid annotation: " << anno.str() << "\n";
				return;
			}
			stream >> max;
			if (stream.fail()) {
				stream.clear();
				errs() << "Invalid annotation: " << anno.str() << "\n";
				return;
			}
			stream >> min;
			if (stream.fail()) {
				stream.clear();
				errs() << "Invalid annotation: " << anno.str() << "\n";
				return;
			}
			stream >> prec;
			if (stream.fail()) {
				stream.clear();
				errs() << "Invalid annotation: " << anno.str() << "\n";
				return;
			}
			Annotation a = Annotation(max, min, prec);
			annotationGroup.emplace(varName, a);
		}
		
		/**
		 * @param F the Function that will be passed over
		 * 
		 * 		  Currently only goes through all of the instructions, 
		 * 		  checking if it is a call to llvm.var.annotation and 
		 *        then getting the annotation information from it.
		 * 
		 */
		 void functionPass(Function &F) 
		 {
			 // if this is an llvm function then just return 
			 if (F.getName().find("llvm") != std::string::npos) {
				 return;
			 }
			 std::unordered_map<std::string, Annotation> localAnnotations;
			 errs() << "found function: " << F.getName() << "\n";
			 for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
				 if (isa<CallInst>(*I)) {
					StringRef name = cast<CallInst>(*I).getCalledFunction()->getName();
					if (name == "llvm.var.annotation") { // if this is an annotation, then get the annotation string
						Value *val = cast<CallInst>(*I).getArgOperand(1); // cast to a function call and get the second operand
						Value *us = cast<User>(*val).getOperand(0); // Get the pointer to the global where the annotation is stored
						StringRef anno = cast<ConstantDataArray>(cast<User>(*us).getOperand(0))->getAsCString(); // get the annotation as a string
						this->addAnnotation(localAnnotations, anno);
					}
				} else if (isa<BinaryOperator>(*I)) {
					errs() << "\t";
					for (int i = 0; i < cast<User>(*I).getNumOperands(); i++) {
						errs() << cast<User>(*I).getOperand(i)->getName().str() << " ";
					}
					errs() << "\n";
				}
			 }
			 
		 }
		
		/**
		 * 
		 * @param M the Module that will be passed over
		 * 
		 * Loop over all global annotations and extract them
		 * For each function in the code
		 * 		If the function was created by LLVM 
		 * 			skip it
		 * 		Create a new local annotation group for the Function
		 * 			For each Instruction in the Function				
		 * 				If the Instruction is a call to llvm
		 * 					(This signals that it is the start or end of an annotation, or it is getting the annotation)
		 * 				If the instruction is some form of asignment 
		 * 					work out the new values size based on the values used and type of asignment that it is 
		 */
        virtual bool runOnModule(Module &M) 
		{
            GlobalVariable *global_annos = M.getNamedGlobal("llvm.global.annotations");
            if (global_annos) { 
              ConstantArray *a = cast<ConstantArray>(global_annos->getOperand(0));
              for (int i=0; i < a->getNumOperands(); i++) {
                ConstantStruct *e = cast<ConstantStruct>(a->getOperand(i));
                StringRef anno = cast<ConstantDataArray>(cast<GlobalVariable>(e->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
                this->addAnnotation(this->annotations, anno);
              }
            }

            for (Module::iterator curFunc = M.begin(), endFunc = M.end(); curFunc != endFunc; ++curFunc) {
				this->functionPass(*curFunc);
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
