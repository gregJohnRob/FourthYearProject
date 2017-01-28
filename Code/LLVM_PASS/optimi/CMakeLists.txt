add_library(OptimiPass MODULE
    # List your source files here.
    Annotation.h
    Annotation.cpp
    DependencyCounter.h
    DependencyCounter.cpp
    globalIncludes.h
    Marker.h
    Marker.cpp
    Marker_AggregateOperationHandlers.cpp
    Marker_BinaryOperationHandlers.cpp
    Marker_BitwiseBinaryOperationHandlers.cpp
    Marker_ConversionOperationHandlers.cpp
    Marker_MemoryAccessAndAddressingOperationHandlers.cpp
    Marker_OtherOperationHandlers.cpp
    Marker_TerminatorInstructionHandlers.cpp
    Marker_VectorOperationHandlers.cpp
    Optimi.h
    Optimi.cpp
)

# Use C++11 to compile our pass (i.e., supply -std=c++11).
target_compile_features(OptimiPass PRIVATE cxx_range_for cxx_auto_type)

# LLVM is (typically) built with no C++ RTTI. We need to match that;
# otherwise, we'll get linker errors about missing RTTI data.
set_target_properties(OptimiPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(OptimiPass PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
    )
endif(APPLE)
