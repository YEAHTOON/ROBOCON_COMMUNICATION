# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/yezhiteng/anaconda3/lib/python3.9/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/yezhiteng/anaconda3/lib/python3.9/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build

# Include any dependencies generated for this target.
include CMakeFiles/yzttcp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/yzttcp.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/yzttcp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/yzttcp.dir/flags.make

CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o: CMakeFiles/yzttcp.dir/flags.make
CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o: /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp
CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o: CMakeFiles/yzttcp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o -MF CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o.d -o CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o -c /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp

CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp > CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.i

CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp -o CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.s

# Object files for target yzttcp
yzttcp_OBJECTS = \
"CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o"

# External object files for target yzttcp
yzttcp_EXTERNAL_OBJECTS =

/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/lib/libyzttcp.a: CMakeFiles/yzttcp.dir/code/tcp/tcp.cpp.o
/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/lib/libyzttcp.a: CMakeFiles/yzttcp.dir/build.make
/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/lib/libyzttcp.a: CMakeFiles/yzttcp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/lib/libyzttcp.a"
	$(CMAKE_COMMAND) -P CMakeFiles/yzttcp.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yzttcp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/yzttcp.dir/build: /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/lib/libyzttcp.a
.PHONY : CMakeFiles/yzttcp.dir/build

CMakeFiles/yzttcp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/yzttcp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/yzttcp.dir/clean

CMakeFiles/yzttcp.dir/depend:
	cd /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/build/CMakeFiles/yzttcp.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/yzttcp.dir/depend
