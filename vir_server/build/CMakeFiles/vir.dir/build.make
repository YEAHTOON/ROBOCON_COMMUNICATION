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
CMAKE_SOURCE_DIR = /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build

# Include any dependencies generated for this target.
include CMakeFiles/vir.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/vir.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/vir.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vir.dir/flags.make

CMakeFiles/vir.dir/main.cpp.o: CMakeFiles/vir.dir/flags.make
CMakeFiles/vir.dir/main.cpp.o: /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/main.cpp
CMakeFiles/vir.dir/main.cpp.o: CMakeFiles/vir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/vir.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/vir.dir/main.cpp.o -MF CMakeFiles/vir.dir/main.cpp.o.d -o CMakeFiles/vir.dir/main.cpp.o -c /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/main.cpp

CMakeFiles/vir.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/vir.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/main.cpp > CMakeFiles/vir.dir/main.cpp.i

CMakeFiles/vir.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/vir.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/main.cpp -o CMakeFiles/vir.dir/main.cpp.s

CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o: CMakeFiles/vir.dir/flags.make
CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o: /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp
CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o: CMakeFiles/vir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o -MF CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o.d -o CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o -c /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp

CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp > CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.i

CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp -o CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.s

# Object files for target vir
vir_OBJECTS = \
"CMakeFiles/vir.dir/main.cpp.o" \
"CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o"

# External object files for target vir
vir_EXTERNAL_OBJECTS =

vir: CMakeFiles/vir.dir/main.cpp.o
vir: CMakeFiles/vir.dir/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/code/tcp/tcp.cpp.o
vir: CMakeFiles/vir.dir/build.make
vir: CMakeFiles/vir.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable vir"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vir.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vir.dir/build: vir
.PHONY : CMakeFiles/vir.dir/build

CMakeFiles/vir.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vir.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vir.dir/clean

CMakeFiles/vir.dir/depend:
	cd /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build /home/yezhiteng/PROJECTS/PRODUCTS/COMMUNICATION/vir_server/build/CMakeFiles/vir.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/vir.dir/depend

