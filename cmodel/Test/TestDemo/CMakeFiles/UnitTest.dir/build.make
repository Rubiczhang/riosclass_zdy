# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake3

# The command to remove a file.
RM = /usr/bin/cmake3 -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo

# Include any dependencies generated for this target.
include CMakeFiles/UnitTest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/UnitTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UnitTest.dir/flags.make

CMakeFiles/UnitTest.dir/Test/testAddition.cc.o: CMakeFiles/UnitTest.dir/flags.make
CMakeFiles/UnitTest.dir/Test/testAddition.cc.o: Test/testAddition.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UnitTest.dir/Test/testAddition.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UnitTest.dir/Test/testAddition.cc.o -c /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo/Test/testAddition.cc

CMakeFiles/UnitTest.dir/Test/testAddition.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UnitTest.dir/Test/testAddition.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo/Test/testAddition.cc > CMakeFiles/UnitTest.dir/Test/testAddition.cc.i

CMakeFiles/UnitTest.dir/Test/testAddition.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UnitTest.dir/Test/testAddition.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo/Test/testAddition.cc -o CMakeFiles/UnitTest.dir/Test/testAddition.cc.s

# Object files for target UnitTest
UnitTest_OBJECTS = \
"CMakeFiles/UnitTest.dir/Test/testAddition.cc.o"

# External object files for target UnitTest
UnitTest_EXTERNAL_OBJECTS =

UnitTest: CMakeFiles/UnitTest.dir/Test/testAddition.cc.o
UnitTest: CMakeFiles/UnitTest.dir/build.make
UnitTest: libadditionLib.a
UnitTest: CMakeFiles/UnitTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UnitTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UnitTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/UnitTest.dir/build: UnitTest

.PHONY : CMakeFiles/UnitTest.dir/build

CMakeFiles/UnitTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UnitTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UnitTest.dir/clean

CMakeFiles/UnitTest.dir/depend:
	cd /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo /work/stu/dyzhang/projects/riosclass_zdy/cmodel/Test/TestDemo/CMakeFiles/UnitTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UnitTest.dir/depend
