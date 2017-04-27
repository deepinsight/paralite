# Finds libcityhash
#
# This module defines:
# CITYHASH_INCLUDE_DIR
# CITYHASH_LIBRARIES
#

find_path(CITYHASH_INCLUDE_DIR NAMES city.h)
find_library(CITYHASH_LIBRARIES NAMES cityhash)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    CITYHASH DEFAULT_MSG
    CITYHASH_LIBRARIES CITYHASH_INCLUDE_DIR)

if (NOT CITYHASH_FOUND)
  message(STATUS "Using third-party bundled CityHash")
else()
  message(STATUS "Found CITYHASH: ${CITYHASH_LIBRARIES}")
endif (NOT CITYHASH_FOUND)

mark_as_advanced(CITYHASH_INCLUDE_DIR CITYHASH_LIBRARIES)