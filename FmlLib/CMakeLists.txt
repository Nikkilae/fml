
cmake_minimum_required(VERSION "3.14")

project(FmlLib VERSION 1.0.0)

set(FML_FMOD_DIRECTORY "" CACHE FILEPATH "Path to FMOD engine library.")
option(FML_IS_UBUNTU OFF)

message(STATUS "FML_FMOD_DIRECTORY: ${FML_FMOD_DIRECTORY}")
message(STATUS "FML_IS_UBUNTU: ${FML_IS_UBUNTU}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(FML_IS_UBUNTU)
    add_compile_definitions("FML_IS_UBUNTU")
endif()

set(FML_SRC_DIR "${PROJECT_SOURCE_DIR}/src")

file(GLOB SOURCE_FILES
    "${FML_SRC_DIR}/fml_*.hpp"
    "${FML_SRC_DIR}/fml_*.cpp"
    "${FML_SRC_DIR}/internal_common.hpp"
    "${FML_SRC_DIR}/internal_common.cpp"
)

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})

if (FML_IS_UBUNTU)
    set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "lib")
    set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "fml")
    set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".so")
else()
    set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
    set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "fml_x64")
    set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".dll")
endif()

include_directories(
    "${FML_FMOD_DIRECTORY}/api/core/inc"
    "${FML_FMOD_DIRECTORY}/api/studio/inc"
)

if (FML_IS_UBUNTU)
    link_libraries(
        "${FML_FMOD_DIRECTORY}/api/core/lib/x86_64/libfmod.so.13"
        "${FML_FMOD_DIRECTORY}/api/studio/lib/x86_64/libfmodstudio.so.13"
    )
else()
    # TODO link_libraries with absolute paths instead (like with linux)
    link_directories(
        "${FML_FMOD_DIRECTORY}/api/core/lib"
        "${FML_FMOD_DIRECTORY}/api/studio/lib"
    )
endif()

# Copy FMOD DLLs into the build directory so that the extension generator program
# can later copy them from there to the actual extension.
if (FML_IS_UBUNTU)
    configure_file(
        "${FML_FMOD_DIRECTORY}/api/core/lib/x86_64/libfmod.so.13"
        "${CMAKE_CURRENT_BINARY_DIR}/libfmod.so.13"
        COPYONLY
    )
    configure_file(
        "${FML_FMOD_DIRECTORY}/api/studio/lib/x86_64/libfmodstudio.so.13"
        "${CMAKE_CURRENT_BINARY_DIR}/libfmodstudio.so.13"
        COPYONLY
    )
else()
    configure_file(
        "${FML_FMOD_DIRECTORY}/api/core/lib/x64/fmod.dll"
        "${CMAKE_CURRENT_BINARY_DIR}/fmod.dll"
        COPYONLY
    )
    configure_file(
        "${FML_FMOD_DIRECTORY}/api/studio/lib/x64/fmodstudio.dll"
        "${CMAKE_CURRENT_BINARY_DIR}/fmodstudio.dll"
        COPYONLY
    )
endif()

if (FML_IS_UBUNTU)
    target_link_libraries(
        ${PROJECT_NAME}
        "${CMAKE_CURRENT_BINARY_DIR}/libfmod.so.13"
        "${CMAKE_CURRENT_BINARY_DIR}/libfmodstudio.so.13"
    )
else()
    target_link_libraries(
        ${PROJECT_NAME}
        "${FML_FMOD_DIRECTORY}/api/core/lib/x64/fmod_vc.lib"
        "${FML_FMOD_DIRECTORY}/api/studio/lib/x64/fmodstudio_vc.lib"
    )
endif()
