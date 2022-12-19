cmake_minimum_required(VERSION 3.14)
project(MyAddtion VERSION 0.1)

set (CMAKE_CXX_STANDARD 17)

# Addition
add_library(additionLib src/Addition.cc src/Addition.hpp)

# Unit Tests
# Add test cpp file
add_executable(UnitTest Test/testAddition.cc)

# Link addtion lib
target_link_libraries(UnitTest additionLib)

# Link test executable executable against getst & gtest_main
target_link_libraries(UnitTest gtest gtest_main pthread)