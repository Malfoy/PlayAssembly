#~ CC=/usr/bin/g++
CC=g++
CFLAGS=  -Wall -Wextra  -Ofast -std=c++11  -pthread -pipe
LDFLAGS=-pthread


ifeq ($(gprof),1)
CFLAGS=-std=c++0x -pg -O3  -march=native
LDFLAGS=-pg
endif

ifeq ($(valgrind),1)
CFLAGS=-std=c++0x -O3 -g
LDFLAGS=-g
endif


EXEC= n50

all: $(EXEC)


n50:   n50.o
	$(CC) -o $@ $^ $(LDFLAGS)

n50.o: N50.cpp
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	rm -rf *.o
	rm -rf $(EXEC)


rebuild: clean $(EXEC)
