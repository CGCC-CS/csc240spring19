CC=gcc
CFLAGS=-Wall -pedantic -ansi

all: multifile.c mystuff.o
	$(CC) $(CFLAGS) multifile.c mystuff.o

mystuff.o: mystuff.c
	$(CC) $(CFLAGS) -c mystuff.c

clean:
	rm -rf *.o *~ a.*
