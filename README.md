# CUDA-SAXPY-KERNEL
For a Local Machine

    Check CUDA Toolkit Installation:
    Ensure that you have the NVIDIA CUDA Toolkit installed on your machine. You can check this by running nvcc --version in the terminal. If not installed, download and install it from the official NVIDIA website.

    Update the Makefile:
    Modify the makefile to match your installed CUDA version. For instance, if you have CUDA 10.2 installed, your paths in the makefile should point to /usr/local/cuda-10.2/include and /usr/local/cuda-10.2/lib64.

    Compilation with Make:
    Use the make command in your terminal to compile the main.cu file. This will create the saxpy executable, given that your makefile has the appropriate instructions for compilation.

    Run the Executable:
    Execute ./saxpy > 2000.txt to run the program and redirect the output to 2000.txt.

For a Cluster Environment

    Allocate Resources:
    Use the salloc.sh script to allocate resources. The script should include commands to request 40 CPUs and 1 GPU, but the specifics may vary based on your cluster's job scheduling system.

    Load Modules:
    Execute the moduls.sh file to load the necessary modules for gcc and cuda. You might need to modify this file to load the correct versions of gcc and cuda modules available on your cluster.

    Compilation:
    Run the make command after setting up the environment with the moduls.sh script. This will compile the code and create the saxpy executable.

    Execute the Program:
    After the compilation, execute the saxpy program by typing ./saxpy in the command line, and redirect the output to 2000.txt as before.

Important Notes:

    The provided instructions assume that the main.cu, makefile, salloc.sh, and moduls.sh files are correctly written and configured for your specific hardware and software environment.
    Always verify that the CUDA version in the makefile and module load script (moduls.sh) matches the version installed on your machine or cluster.
    Before running the make command, ensure that the makefile has the correct paths and instructions for your system's architecture and the intended CUDA toolkit version.

