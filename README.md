# CUDA-SAXPY-KERNEL
The SAXPY kernel is a basic operation in high-performance computing and is a part of the Basic Linear Algebra Subprograms (BLAS) library. SAXPY stands for "Single-Precision A X Plus Y" and is a combination of scalar multiplication and vector addition, following the formula Y:=αX+Y, where:

    α is a scalar,
    X and Y are vectors of the same size,
    := denotes that the vector YY is being updated with the result.

This operation is fundamental in many scientific and engineering calculations, as it is a building block for more complex operations like matrix multiplication. SAXPY is used extensively in fields that require large-scale numerical computations, such as fluid dynamics, structural analysis, and other simulations that rely on linear algebra routines.

The importance of the SAXPY kernel comes from its simplicity and efficiency in utilizing computational resources, particularly within parallel computing environments. The operation is highly scalable and can be optimized to take advantage of vector processing units in CPUs and GPUs, making it an essential part of performance-critical applications. SAXPY can also serve as a benchmark to measure the performance of a computing system's floating-point operations.

For a Local Machine

    Check CUDA Toolkit Installation:
    Ensure that you have the NVIDIA CUDA Toolkit installed on your machine.
    You can check this by running nvcc --version in the terminal. If not installed, download and install it from the official NVIDIA website.

    Update the Makefile:
    Modify the makefile to match your installed CUDA version.
    For instance, if you have CUDA 10.2 installed, your paths in the makefile should point to /usr/local/cuda-10.2/include and /usr/local/cuda-10.2/lib64.

    Compilation with Make:
    Use the make command in your terminal to compile the main.cu file.
    This will create the saxpy executable, given that your makefile has the appropriate instructions for compilation.

    Run the Executable:
    Execute ./saxpy > 2000.txt to run the program and redirect the output to 2000.txt.


Important Notes:

    The provided instructions assume that the main.cu, makefile, salloc.sh, and moduls.sh files are correctly written and configured for your specific hardware and software environment.
    Always verify that the CUDA version in the makefile and module load script (moduls.sh) matches the version installed on your machine or cluster.
    Before running the make command, ensure that the makefile has the correct paths and instructions for your system's architecture and the intended CUDA toolkit version.

