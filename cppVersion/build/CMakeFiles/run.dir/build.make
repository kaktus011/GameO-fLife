# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/denis/projects/gameOfLife/cppVersion

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/denis/projects/gameOfLife/cppVersion/build

# Include any dependencies generated for this target.
include CMakeFiles/run.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/run.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/run.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/run.dir/flags.make

CMakeFiles/run.dir/src/Main.cpp.o: CMakeFiles/run.dir/flags.make
CMakeFiles/run.dir/src/Main.cpp.o: /home/denis/projects/gameOfLife/cppVersion/src/Main.cpp
CMakeFiles/run.dir/src/Main.cpp.o: CMakeFiles/run.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/denis/projects/gameOfLife/cppVersion/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/run.dir/src/Main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/run.dir/src/Main.cpp.o -MF CMakeFiles/run.dir/src/Main.cpp.o.d -o CMakeFiles/run.dir/src/Main.cpp.o -c /home/denis/projects/gameOfLife/cppVersion/src/Main.cpp

CMakeFiles/run.dir/src/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/run.dir/src/Main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/denis/projects/gameOfLife/cppVersion/src/Main.cpp > CMakeFiles/run.dir/src/Main.cpp.i

CMakeFiles/run.dir/src/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/run.dir/src/Main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/denis/projects/gameOfLife/cppVersion/src/Main.cpp -o CMakeFiles/run.dir/src/Main.cpp.s

# Object files for target run
run_OBJECTS = \
"CMakeFiles/run.dir/src/Main.cpp.o"

# External object files for target run
run_EXTERNAL_OBJECTS =

run: CMakeFiles/run.dir/src/Main.cpp.o
run: CMakeFiles/run.dir/build.make
run: CMakeFiles/run.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/denis/projects/gameOfLife/cppVersion/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable run"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/run.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/run.dir/build: run
.PHONY : CMakeFiles/run.dir/build

CMakeFiles/run.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run.dir/clean

CMakeFiles/run.dir/depend:
	cd /home/denis/projects/gameOfLife/cppVersion/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/denis/projects/gameOfLife/cppVersion /home/denis/projects/gameOfLife/cppVersion /home/denis/projects/gameOfLife/cppVersion/build /home/denis/projects/gameOfLife/cppVersion/build /home/denis/projects/gameOfLife/cppVersion/build/CMakeFiles/run.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/run.dir/depend

