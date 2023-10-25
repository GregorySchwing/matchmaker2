CC=g++
CXX=$(CC)
CFLAGS=-lm -O3
CXXFLAGS=$(CFLAGS)
LD=$(CXX)
NVCC=nvcc
LDFLAGS = $(CFLAGS)
NVCC=nvcc
CUDAFLAGS = -O3 -Xptxas -O3 -Xcompiler -O3 -w 


all: mmaker
mmaker: main.cpp cudaBFS.h cudaBFS.cu MMArguments.cpp cheap.c matching.c MMArguments.h matchmaker.h
	$(NVCC) $(LDFLAGS) $(CUDAFLAGS)  -c -o main.o main.cpp
	$(NVCC) $(LDFLAGS) $(CUDAFLAGS)  -c -o cudaBFS.o cudaBFS.cu
	$(CC) $(LDFLAGS)   -c -o MMArguments.o MMArguments.cpp
	$(CC) $(LDFLAGS)   -c -o cheap.o cheap.c
	$(CC) $(LDFLAGS)   -c -o matching.o matching.c
	$(NVCC) *.o -o mmaker $(LDFLAGS)


clean: 
	-rm -rf *.o mmaker

depend:
	makedepend -Y *.cpp *.c *.hpp
