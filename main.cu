#include <cuda_runtime.h>
#include <iostream>

// CUDA kernel function for SAXPY: Single-Precision A*X Plus Y.
__global__ void saxpy_parallel(int n, float alpha, float *x, float *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        y[i] = alpha * x[i] + y[i]; // Perform the computation
    }

    // Print block number - only print once per block using the thread with threadIdx.x == 0
    if (threadIdx.x == 0) {
        printf("Block number %d\n", blockIdx.x);
        printf("blockDim.x = %d\n",blockDim.x);
    }
    //printf("threadIdx.x = %d\n",threadIdx.x);
}

int main()
{
    const int n = 2000; // Example array size
    float *x, *y; // Pointers for host arrays
    float *d_x, *d_y; // Pointers for device arrays

    // Allocate host memory
    x = (float*)malloc(n * sizeof(float));
    y = (float*)malloc(n * sizeof(float));

    // Initialize host arrays
    for(int i = 0; i < n; i++) {
        x[i] = i;
        y[i] = n - i;
    }

    // Allocate device memory
    cudaMalloc(&d_x, n * sizeof(float));
    cudaMalloc(&d_y, n * sizeof(float));

    // Copy host data to device
    cudaMemcpy(d_x, x, n * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(d_y, y, n * sizeof(float), cudaMemcpyHostToDevice);

    // Invoke the SAXPY kernel (256 threads per block)
    int nblocks = (n + 255) / 256;
    saxpy_parallel<<<nblocks, 256>>>(n, 2.0f, d_x, d_y);

    //blockDim.x = 256;
    //for (int block = 0; block < nblocks; nblocks++) {
        //blockIdx.x = block;
        //for (int thread = 0; thread < 256; thread++) {
            //threadIdx.x = thread;
            //saxpy_parallel(n, 2.0f, d_x, d_y);
        //}
    //}

    // Copy result back to host
    cudaMemcpy(y, d_y, n * sizeof(float), cudaMemcpyDeviceToHost);

    // Free device memory
    cudaFree(d_x);
    cudaFree(d_y);

    // Print the content of the array
    for (int i = 0; i < n; ++i) {
        printf("y[%d] = %f\n", i, y[i]);
    }
    // Free host memory
    free(x);
    free(y);

    return 0;
}