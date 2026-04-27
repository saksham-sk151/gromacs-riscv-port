#include <stdio.h>
#include <time.h>

int main() {
    // Double precision computation (typical in HPC)
    double sum = 0.0;
    clock_t start = clock();
    
    for(long i = 0; i < 10000000; i++) {
        sum += (double)i * 3.14159265359;
    }
    
    clock_t end = clock();
    double time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
    
    printf("Result: %f\n", sum);
    printf("Time: %f seconds\n", time_taken);
    printf("RISC-V double-precision HPC test completed!\n");
    
    return 0;
}
