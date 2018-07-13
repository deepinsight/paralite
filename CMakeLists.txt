cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)

project(Paralite)

IF(NOT CMAKE_BUILD_TYPE)
    message(STATUS "CMAKE_BUILD_TYPE is not set, set to default = RELWITHDEBINFO")
    set(CMAKE_BUILD_TYPE            "RELWITHDEBINFO")
ENDIF()
MESSAGE( STATUS "CMAKE_BUILD_TYPE: " ${CMAKE_BUILD_TYPE} )

set(CMAKE_CONFIGURATION_TYPES "RelWithDebInfo;Debug;Release;MinSizeRel" CACHE STRING "" FORCE)

IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64.*|AARCH64.*)")
    set(AARCH64 1)
ENDIF()
IF (NOT AARCH64)
    set(MACHINE_FLAGS "-msse4 -mpopcnt -fopenmp -finline-functions")
ENDIF()

set(COMMON_WARNING_FLAGS "-Wall -Werror -Wnon-virtual-dtor -Wno-sign-compare -Wno-unused-variable -Wno-unused-function -Wno-unused-result")

set(DEFINITION_FLAGS "-DDIFACTO_USE_LZ4=1 -DDIFACTO_USE_CITY=1")

set(CMAKE_BUILD_COLOR_MAKEFILE          ON)
set(CMAKE_CXX_FLAGS "-std=c++11 ${COMMON_WARNING_FLAGS} ${MACHINE_FLAGS} ${DEFINITION_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE             "-O3 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO      "-O3 -g")

# cmake -DCMAKE_BUILD_TYPE=Debug ..
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")

message(STATUS "CXX_FLAGS:=${CMAKE_CXX_FLAGS}")

message(STATUS "CMAKE_MODULE_PATH:=${CMAKE_MODULE_PATH}")

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/dmlc-core/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/dmlc-core/src")

set(PARALITE_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}
        CACHE PATH "Path to Parabee include files.")

add_subdirectory(dmlc-core)
add_subdirectory(ps-lite)
add_subdirectory(src)

