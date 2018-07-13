# Required libraries
find_package(Glog 0.3.4 REQUIRED)
find_package(ZeroMQ 4.1.0 REQUIRED)
find_package(Protobuf REQUIRED)
find_package(Threads REQUIRED)
find_package(LZ4 REQUIRED)
find_package(CityHash REQUIRED)

include_directories("${PARALITE_ROOT_DIR}/include")
include_directories("${PARALITE_ROOT_DIR}/src")
include_directories("${PARALITE_ROOT_DIR}/ps-lite/include")

file(GLOB_RECURSE Paralite_SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*")
add_executable(difacto ${Paralite_SOURCE_FILES})
target_include_directories(difacto PUBLIC
        ${ZeroMQ_INCLUDE_DIRS}
        ${GLOG_INCLUDE_DIRS}
        ${LZ4_INCLUDE_DIR}
        ${CITYHASH_INCLUDE_DIR})
target_link_libraries(difacto PUBLIC
        z rt nsl
        ${PROJECT_BINARY_DIR}/dmlc-core/libdmlc.a
        ${PROJECT_BINARY_DIR}/ps-lite/libpslite.a
        ${CMAKE_THREAD_LIBS_INIT}
        ${ZeroMQ_LIBRARIES}
        ${GLOG_LIBRARIES}
        ${LZ4_LIBRARIES}
        ${Protobuf_LIBRARIES}
        ${CITYHASH_LIBRARIES})

