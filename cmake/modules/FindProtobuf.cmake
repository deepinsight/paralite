include(FindPackageHandleStandardArgs)

find_path(Protobuf_INCLUDE_DIR NAMES "include/google/protobuf/stubs/common.h")

find_library(Protobuf_LIBRARIES NAMES protobuf)

find_package_handle_standard_args(Protobuf DEFAULT_MSG
    Protobuf_LIBRARIES
    Protobuf_INCLUDE_DIR)

find_program(PROTOBUF_PROTOC_EXECUTABLE
    NAMES protoc
    DOC "The Google Protocol Buffers Compiler"
)

# hide locals from GUI
mark_as_advanced(
    Protobuf_INCLUDE_DIR
    Protobuf_LIBRARIES
    PROTOBUF_PROTOC_EXECUTABLE)