
cmake_minimum_required(VERSION "3.14")

project(ExampleCpp VERSION 1.0.0)

set(FML_FMOD_DIRECTORY "" CACHE FILEPATH "Path to FMOD engine library.")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS "FML_FMOD_DIRECTORY: ${FML_FMOD_DIRECTORY}")

add_executable(${PROJECT_NAME} "main.cpp")

include_directories(
    "${FML_FMOD_DIRECTORY}/api/core/inc"
    "${FML_FMOD_DIRECTORY}/api/studio/inc"
)

link_libraries(
    "${FML_FMOD_DIRECTORY}/api/core/lib/x64/fmod.dll"
    "${FML_FMOD_DIRECTORY}/api/studio/lib/x64/fmodstudio.dll"
)

target_link_libraries(
    ${PROJECT_NAME}
    "${FML_FMOD_DIRECTORY}/api/core/lib/x64/fmod_vc.lib"
    "${FML_FMOD_DIRECTORY}/api/studio/lib/x64/fmodstudio_vc.lib"
)
