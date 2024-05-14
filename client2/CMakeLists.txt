cmake_minimum_required(VERSION 3.0)

project(cli)

include_directories(../code/tcp)
include_directories(../code/log)

add_executable(cli main.cpp)

target_link_libraries(cli ${CMAKE_CURRENT_SOURCE_DIR}/../lib/libyzttcp.a)
