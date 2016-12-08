#include "AnnotationStore.h"

using namespace llvm;
using namespace optimi;

const unsigned AnnotationStore::INT = 0;

bool AnnotationStore::addAnnotation(StringRef anno, Value *value) {
    std::string annoString = anno.str();
    std::stringstream stream(annoString);
    int data[3];
    for (int i = 0; i < 3; i++) {
        stream >> data[i];
        if (stream.fail()) {
            stream.clear();
            errs() << "Invalid annotation: " << anno.str() << "\n";
            return false;
        }
    }
    Annotation a = Annotation(data[0], data[1], data[2]);
    this->annotationMap.insert(std::make_pair(value, a));
    return true;
}

bool AnnotationStore::addAnnotation(Value *value, long max, long min, long precision) {
    if (max < min || precision < 0) {
        return false;
    }
    Annotation a = Annotation(max, min, precision);
    this->annotationMap.insert(std::make_pair(value, a));
    return true;
}

void AnnotationStore::markEquivalent (Value * v1, Value * v2)
{
    std::vector<std::pair<Value *, Value *>> tempEquivalents;
    for (auto curr = this->equivalents.begin(), end = this->equivalents.end(); curr != end; curr++) {
        if (curr->first == v1 && curr->second == v2) {
            return;
        } else if (curr->second == v1 && curr->first == v2) {
            return;
        }
        if (curr->first == v1) {
            tempEquivalents.push_back(std::make_pair(v2, curr->second));
        }
        if (curr->first == v2) {
            tempEquivalents.push_back(std::make_pair(v1, curr->second));
        }
        if (curr->second == v1) {
            tempEquivalents.push_back(std::make_pair(v2, curr->first));
        }
        if (curr->second == v2) {
            tempEquivalents.push_back(std::make_pair(v1, curr->first));
        }
    }
    for (auto curr = tempEquivalents.begin(), end = tempEquivalents.end(); curr != end; curr++) {
        this->equivalents.push_back(std::make_pair(curr->first, curr->second));
    }
    this->equivalents.push_back(std::make_pair(v1, v2));
}

bool AnnotationStore::addAnnotation(Value *value, unsigned type) {
    switch (type) {
        case AnnotationStore::INT:
            this->annotationMap.insert(std::make_pair(value, Annotation(INT_MAX, INT_MIN, 0)));
            return true;
        default:
            return false;
    }

}

std::pair<Annotation, bool> AnnotationStore::getAnnotation(Value *value)
{
    if (ConstantInt *constant = dyn_cast<ConstantInt>(value)) {
        int x = (int) constant->getValue().signedRoundToDouble();
        return std::make_pair(Annotation(x, x, 0), true);
    }
    auto pair = this->annotationMap.find(value);
    if (pair != this->annotationMap.end()) {
        return std::make_pair(pair->second, true);
    }
    for (auto curr = this->equivalents.begin(), end = this->equivalents.end(); curr != end; curr++) {
        if (curr->first == value) {
            pair = this->annotationMap.find(curr->second);
            if (pair != this->annotationMap.end()) {
                return std::make_pair(pair->second, true);
            }
        } else if (curr->second == value) {
            pair = this->annotationMap.find(curr->first);
            if (pair != this->annotationMap.end()) {
                return std::make_pair(pair->second, true);
            }
        }
    }
    return std::make_pair(Annotation(INT_MAX, INT_MIN, 0), false);
}
