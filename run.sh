#!/bin/bash

threads=4

echo "building disk backed sorting utilities"

cd bsort
cmake -H. -Bbuild && cmake --build build -- -j $threads
cd -
cd mmmultimap
cmake -H. -Bbuild && cmake --build build -- -j $threads
cd -
cd stxxl
cmake -H. -Bbuild -DBUILD_EXAMPLES=ON -DCMAKE_BUILD_TYPE=Release && cmake --build build -- -j $threads
cd -

echo
echo "making test data"

cat /dev/urandom | head -c $(echo '8 * 1000000000' | bc) >q

echo
echo "testing stxxl"

cp q z && time OMP_NUM_THREADS=$threads stxxl/build/examples/algo/sort_file sort z

echo
echo "testing bsort"

cp q z && time bsort/bin/bsort -r 8 -k 8 -t $threads z

echo
echo "testing ips4o"

cp q z && time mmmultimap/bin/test_sort -t $threads -i z
