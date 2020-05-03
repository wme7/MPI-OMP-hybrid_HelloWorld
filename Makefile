# Project: HelloWorld MPI+OMP
# Use this make to compile in a LINUX box.
# Use the CMakeList to compile in MacOS.

BINS:= hellowMPI.run hellowOMP.run hellowHybrid.run

all: $(BINS)

hellowMPI.run: mpi-hello.c
	mpicc -o hellowMPI.run mpi-hello.c

hellowOMP.run: omp-hello.c
	gcc-9 -fopenmp -o hellowOMP.run omp-hello.c

hellowHybrid.run: hybrid-hello.c
	mpicc -fopenmp -lgomp -o hellowHybrid.run hybrid-hello.c

test: $(BINS)
	@echo "Test MPI..."
	@mpirun -np 2 ./hellowMPI.run
	@echo "Test OpenMP..."
	@./hellowOMP.run
	@echo "Test Hybrid..."
	@mpirun -np 2 ./hellowHybrid.run

clean:
	@rm -f $(BINS)