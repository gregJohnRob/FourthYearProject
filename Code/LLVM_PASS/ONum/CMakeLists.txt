add_library(ONumPass MODULE
    # List your source files here.
    # Annotation
        Annotation/Annotation.h
        Annotation/Annotation.cpp
    # Dependency Counter
        DependencyCounter/DependencyCounter.h
        DependencyCounter/DependencyCounter.cpp
    # Marker
        Marker/Marker.h
        Marker/Marker.cpp
        Marker/AggregateOperationHandlers.cpp
        Marker/BinaryOperationHandlers.cpp
        Marker/BitwiseBinaryOperationHandlers.cpp
        Marker/ConversionOperationHandlers.cpp
        Marker/MemoryAccessAndAddressingOperationHandlers.cpp
        Marker/OtherOperationHandlers.cpp
        Marker/TerminatorInstructionHandlers.cpp
        Marker/VectorOperationHandlers.cpp
    # ONum
        ONum/ONum.h
        ONum/ONum.cpp
    globalIncludes.h
)

# Use C++11 to compile our pass (i.e., supply -std=c++11).
target_compile_features(ONumPass PRIVATE cxx_range_for cxx_auto_type)

# LLVM is (typically) built with no C++ RTTI. We need to match that;
# otherwise, we'll get linker errors about missing RTTI data.
set_target_properties(ONumPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(ONumPass PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
    )
endif(APPLE)
