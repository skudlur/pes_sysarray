# pes_sysarray
Systolic Array Matrix Multiplier implementation for ASIC Course by [Kunal Ghosh](https://github.com/kunalg123/) of the [VSD Group](https://www.vlsisystemdesign.com/).

### What is a Systolic Array?
A systolic array is a parallel processing architecture that consists of a network of tightly coupled processing elements (PEs) that perform computations on data as it flows through the array. The PEs are arranged in a regular grid and are connected to their nearest neighbors. Each PE performs a simple operation on its input data and then passes the result to its neighbors.

One of the advantages of systolic arrays is that they can achieve high throughput with relatively simple hardware. This is because the PEs are all performing the same operation on different data elements, which allows for pipelining and parallelism. Additionally, the systolic array architecture is very scalable, as the number of PEs can be increased to achieve even higher throughput.

![sys_array](https://github.com/skudlur/pes_sysarray/blob/main/sys_array.jpg)

### Systolic Array Architecture for Matrix Multiplication
A systolic array for matrix multiplication is a parallel processing architecture that uses a network of processing elements (PEs) to perform matrix multiplication in a pipelined fashion. The PEs are arranged in a regular grid and are connected to their nearest neighbors.

![matmul](https://github.com/skudlur/pes_sysarray/blob/main/matmul.gif)

### RTL
![rtl](https://github.com/skudlur/pes_sysarray/blob/main/rtl.jpeg)

### Statistics
![stat](https://github.com/skudlur/pes_sysarray/blob/main/stats.jpeg)

### Pre-synthesis simulation waveforms
![pre_syn](https://github.com/skudlur/pes_sysarray/blob/main/pre_syn.jpeg)

### Post-synthesis simulation waveforms
![post_syn](https://github.com/skudlur/pes_sysarray/blob/main/post_syn.jpeg)
