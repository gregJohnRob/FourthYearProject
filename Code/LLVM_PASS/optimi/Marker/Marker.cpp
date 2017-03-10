#include "Marker.h"

using namespace llvm;
using namespace optimi;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Public methods
///////////////////////////////////////////////////////////////////////////////////////////////////
Marker::Marker() {}

void Marker::analyseInstruction(Value *v)
{
    if (StoreInst *store = dyn_cast<StoreInst>(v)) {
        this->handle_store(store);
    } else if (LoadInst *load = dyn_cast<LoadInst>(v)) {
        this->handle_load(load);
    } else if (SelectInst *select = dyn_cast<SelectInst>(v)) {
        this->handle_select(select);
    } else if (PHINode *phi = dyn_cast<PHINode>(v)) {
        this->handle_phi(phi);
    } else if (BinaryOperator *binary = dyn_cast<BinaryOperator>(v)) {
        this->handle_binary_operator(binary);
    } else if (CastInst *cast = dyn_cast<CastInst>(v)) {
        this->handle_cast(cast);
    } else if (GetElementPtrInst *elemAddr = dyn_cast<GetElementPtrInst>(v)) {
        this->handle_getelementptr(elemAddr);
    } else if (CallInst *call = dyn_cast<CallInst>(v)) {
        this->handle_call(call);
    } else if (TruncInst *truncInst = dyn_cast<TruncInst>(v)) {
        this->handle_trunc(truncInst);
    } else if (CmpInst *cmp = dyn_cast<CmpInst>(v)) {
        this->handle_cmp(cmp);
    } else if (ReturnInst *ret = dyn_cast<ReturnInst>(v)) {
        this->handle_ret(ret);
    }
}

int Marker::finishMethodAnalysis()
{
    int output;
    if (this->dependencyMap.empty()) {
        output = 1;
    } else {
        for (auto i = this->dependencyMap.begin(), end = this->dependencyMap.end(); i != end; i++) {
            this->addAnnotation(i->first, WORST_CASE_INT);
        }
        output = -1;
    }
    for (unsigned i = 0; i < this->dependencyVector.size(); i++) {
        DependencyCounter *dc = dependencyVector[i];
        delete dc;
    }
    return output;
}

void Marker::setFunction(Function *F) {
    this->F = F;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Methods for interacting with dependencyMap, annotationMap
///////////////////////////////////////////////////////////////////////////////////////////////////

int Marker::handleAnnotation(Value *v, Annotation a) {
    if (this->hasAnnotation(v)) {
        errs() << "\t"<< v << " already has an annotation.\n";
        errs() << "\t\t";
        v->dump();
        return -1;
    }
    this->addAnnotation(v, a);
    this->cleanDependencies(v);
    return 1;
}

bool Marker::hasAnnotation(Value *v)
{
    if (ConstantInt *constant = dyn_cast<ConstantInt>(v)) {
        return true;
    } else if (ConstantFP *constantFP = dyn_cast<ConstantFP>(v)) {
        return true;
    }
    return this->annotationMap.find(v) != this->annotationMap.end();
}

Annotation Marker::getAnnotation(Value *v)
{
    if (ConstantInt *constantInt = dyn_cast<ConstantInt>(v)) {
        double x = constantInt->getValue().signedRoundToDouble();
        return Annotation(x, x, 0);
    } else if (ConstantFP *constantFP = dyn_cast<ConstantFP>(v)) {
        double x;
        if (constantFP->getType()->isFloatTy()) {
            x = constantFP->getValueAPF().convertToFloat();
        } else if (constantFP->getType()->isDoubleTy()) {
            x = constantFP->getValueAPF().convertToDouble();
        } else {
            x = 0.0;
            errs() << "constantFP is neither a double nor a float. ";
            constantFP->dump();
        }
        int i = 0;
        double check = x;
        while (fmod(check, 1) != 0.0) {
            i++;
            check *= 10;
        }
        return Annotation(x, x, i);
    }
    return this->annotationMap.find(v)->second;
}

void Marker::addAnnotation(Value *v, Annotation a)
{
    bool carryOn = this->checkForErrors(v,a);
    if (!carryOn) {
        return;
    }
    if (Instruction *instruction = dyn_cast<Instruction>(v)) {
        LLVMContext& C = instruction->getContext();
        MDNode* N = MDNode::get(C, MDString::get(C, a.str()));
        instruction->setMetadata("optimi", N);
    }
    this->annotationMap.insert(std::make_pair(v, a));
}

void Marker::addDependencyCounter(Value *v, DependencyCounter *dc)
{
    auto temp = this->dependencyMap.find(v);
    if (temp != this->dependencyMap.end()) {
        temp->second.push_back(dc);
    } else {
        std::vector<DependencyCounter *> dcVector;
        dcVector.push_back(dc);
        this->dependencyMap.insert(std::make_pair(v, dcVector));
    }
}

void Marker::cleanDependencies(Value *v)
{
    auto temp = this->dependencyMap.find(v);
    if (temp == this->dependencyMap.end()) {
        return;
    }
    std::vector<DependencyCounter *> dcVector = temp->second;
    for (unsigned i = 0; i < dcVector.size(); i++) {
        DependencyCounter *dc = dcVector[i];
        if (--dc->numOfDependencies == 0) {
            analyseInstruction(dc->instruction);
        }
    }
    this->dependencyMap.erase(v);
}

void Marker::markEquivalent(Value *v1, Value *v2, Value *instruction) {
    if (this->hasAnnotation(v1) && this->hasAnnotation(v2)) {
        return;
    }
    if (this->hasAnnotation(v1)) {
        this->handleAnnotation(v2, this->getAnnotation(v1));
    } else if (this->hasAnnotation(v2)) {
        this->handleAnnotation(v1, this->getAnnotation(v2));
    } else {
        this->noteEquivalentDependency(v1, v2, instruction);
    }
}

void Marker::noteEquivalentDependency(Value *v1, Value *v2, Value *instruction) {
    DependencyCounter *dependencyCounter = new DependencyCounter();
    dependencyCounter->numOfDependencies = 1;
    dependencyCounter->instruction = instruction;
    this->dependencyVector.push_back(dependencyCounter);
    this->addDependencyCounter(v1, dependencyCounter);
    this->addDependencyCounter(v2, dependencyCounter);
}

bool Marker::checkForErrors(Value *v, Annotation a) {
    // Alert if a value gets more than one annotation
    if (std::isinf(a.max) || std::isinf(a.min)) {
        errs() << "\t\t" << v->getName().str() << "\n";
    }
    if (this->hasAnnotation(v)) {
        Annotation currA = this->getAnnotation(v);
        if (a.max != currA.max || a.min != currA.min || a.precision != currA.precision) {
            if (v->hasName()) {
                errs() << "\tValue " << v->getName().str()  << " is already annotated\n";
            } else {
                errs() << "\tValue " << v << " is already annotated\n";
            }
            errs() << "\tOriginal annotation: " << currA.str() << ", New annotation: " << a.str() << "\n";
            return false;
        }
    }
    Type *t = v->getType();
    Type::TypeID id = t->getTypeID();

    while (id == Type::PointerTyID) {
        t = t->getPointerElementType();
        id = t->getTypeID();
    }
    // Decide what to do based on type. While all types are included here, not all will
    // require handlers
    switch (id) {
        case Type::VoidTyID: // type with no size
        {
            // TODO: Handler
            break;
        }
        case Type::HalfTyID: // 16-bit floating point type
        {
            // TODO: Handler
            // 32 bit: 1 sign, 5 exponent, 11 mantissa (10 stored)
            auto mantissa = t->getFPMantissaWidth();
            auto primitiveSize = t->getPrimitiveSizeInBits();
            auto exponent = primitiveSize - mantissa;
            if (a.precision > mantissa) {
                errs() << "This variable requires higher precision than is provided\n";
            }
            break;
        }
        case Type::FloatTyID: // 32-bit floating point type
        {
            // TODO: Handler
            // 32 bit: 1 sign, 8 exponent, 24 mantissa (23 stored)
            auto mantissa = t->getFPMantissaWidth();
            auto primitiveSize = t->getPrimitiveSizeInBits();
            auto exponent = primitiveSize - mantissa;
            if (a.precision > mantissa) {
                errs() << "This variable requires higher precision than is provided\n";
            }
            break;
        }
        case Type::DoubleTyID: // 64-bit floating point type
        {
            // TODO: Handler
            // 32 bit: 1 sign, 11 exponent, 53 mantissa (52 stored)
            auto mantissa = t->getFPMantissaWidth();
            auto primitiveSize = t->getPrimitiveSizeInBits();
            auto exponent = primitiveSize - mantissa;
            if (a.precision > mantissa) {
                errs() << "This variable requires higher precision than is provided\n";
            }
            break;
        }
        case Type::X86_FP80TyID: // 80-bit floating point type (X87)
        {
            // TODO: Handler
            break;
        }
        case Type::FP128TyID: // 128-bit floating point type (112-bit mantissa)
        {
            // TODO: Handler
            break;
        }
        case Type::PPC_FP128TyID: // 128-bit floating point type (two 64-bits, PowerPC)
        {
            // TODO: Handler
            break;
        }
        case Type::LabelTyID: // Labels
        {
            // TODO: Handler
            break;
        }
        case Type::MetadataTyID: // Metadata
        {
            // TODO: Handler
            break;
        }
        case Type::X86_MMXTyID: // MMX vectors (64 bits, X86 specific)
        {
            // TODO: Handler
            break;
        }
        case Type::TokenTyID: // Tokens
        {
            // TODO: Handler
            break;
        }
        case Type::IntegerTyID: // Arbitrary bit width integers
        {
            unsigned numBits = t->getIntegerBitWidth();
            double l = log2((a.max > std::abs(a.min)) ? a.max : std::abs(a.min));
            unsigned numBitsA = (unsigned int)std::ceil(l);
            if (numBits < numBitsA) {
                errs() << "\tThe number of bits required to handle ";
                if (v->hasName()) {
                    errs() << v->getName().str();
                } else {
                    errs() << v;
                }
                errs() << " is more than was specified (" << numBits << ")\n";
            }
            break;
        }
        case Type::FunctionTyID: // Functions
        {
            // TODO: Handler
            break;
        }
        case Type::StructTyID: // Structures
        {
            // TODO: Handler
            break;
        }
        case Type::ArrayTyID: // Arrays
        {
            // TODO: Handler
            break;
        }
        case Type::PointerTyID: // Pointers
        {
            // TODO: Handler
            break;
        }
        case Type::VectorTyID: // SIMD 'packed' format, or other vector type
        {
            // TODO: Handler
            break;
        }
        default:
        {
            break;
        }
    }

    // // t->getFPMantissaWidth()
    // // t->getPrimitiveSizeInBits()
    return true;
}
