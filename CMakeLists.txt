cmake_minimum_required (VERSION 3.10 FATAL_ERROR)

project (HelloWorld)

find_package(MPI REQUIRED)
include_directories(${MPI_INCLUDE_PATH})
message("${MPI_INCLUDE_PATH}")

find_package(OpenMP REQUIRED)
if(OPENMP_CXX_FOUND)
  message(STATUS "OpenMP C++ Libraries OK")
else()
  message(STATUS "OpenMP C++ Libraries not found")
endif()

add_executable( hellowMPI.run mpi-hello.c)
add_executable( hellowOMP.run omp-hello.c)
add_executable( hellowHybrid.run hybrid-hello.c)

target_link_libraries( hellowMPI.run ${MPI_LIBRARIES})
target_link_libraries( hellowOMP.run OpenMP::OpenMP_CXX )
target_link_libraries( hellowHybrid.run ${MPI_LIBRARIES} OpenMP::OpenMP_CXX )

