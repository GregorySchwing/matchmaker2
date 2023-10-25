CC=g++
CXX=$(CC)
CFLAGS=-lm -O2 -g
CXXFLAGS=$(CFLAGS)
LD=$(CXX)
NVCC=nvcc
LDFLAGS = $(CFLAGS)
NVCC=nvcc


all: mmaker
mmaker: main.cpp cudaBFS.h cudaBFS.cu MMArguments.cpp cheap.c matching.c MMArguments.h matchmaker.h
	$(NVCC) $(LDFLAGS)   -c -o main.o main.cpp
	$(NVCC) $(LDFLAGS)   -c -o cudaBFS.o cudaBFS.cu
	$(CC) $(LDFLAGS)   -c -o MMArguments.o MMArguments.cpp
	$(CC) $(LDFLAGS)   -c -o cheap.o cheap.c
	$(CC) $(LDFLAGS)   -c -o matching.o matching.c
	$(NVCC) *.o -o mmaker $(LDFLAGS)


clean: 
	-rm -rf *.o mmaker

depend:
	makedepend -Y *.cpp *.c *.hpp
