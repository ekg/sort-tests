# disk backed sorting tests

## usage

To build executables and run all tests, edit `run.sh` to set the desired number of threads, and execute:

```
./run.sh
```

## Example results

Run on a 2017 Lenovo Thinkpad Yoga X1 with a Intel Core i7-7600U CPU with a 1TB SSD capable of ~1GB/s write:

```
[STXXL-MSG] STXXL_PARALLEL_MULTIWAY_MERGE
[STXXL-MSG] STXXL v1.4.99 (prerelease/Release) (git fa4296bb3ce069fba4a59740596a546092e90d1f) + gnu parallel(20181206)
[STXXL-MSG] Disk '/home/erik/stxxl.tmp_file' is allocated, space: 15000 MiB, I/O implementation: syscall queue=0 devid=0
[STXXL-MSG] Sorting...
OMP_NUM_THREADS=4 stxxl/build/examples/algo/sort_file sort z  163.40s user 11.53s system 211% cpu 1:22.75 total

testing bsort

real    1m0.480s
user    2m9.937s
sys     0m18.925s

testing ips4o
data length 1000000000
starting sort
completed in 43.2991s

real    0m43.510s
user    1m19.015s
sys     0m19.636s
```
