#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int nthreads, tid;

    /* Fork a team of threads giving them their own copies of variables */
    #pragma omp parallel private(nthreads, tid) num_threads(2)
    {
        /* Obtain thread number */
        tid = omp_get_thread_num();
        printf("OpenMP: Hello World from thread = %d\n", tid);

        /* Only master thread does this */
        if (tid == 0)
        {
            nthreads = omp_get_num_threads();
            printf("OpenMP: Number of threads = %d\n", nthreads);
        }
    } /* All threads join master thread and disband */

    return 0;
}
