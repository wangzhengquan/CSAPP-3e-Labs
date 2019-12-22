CC = gcc
CFLAGS = -g -Wall -I ..

# This flag includes the Pthreads library on a Linux box.
# Others systems will probably require something different.
LIB = -lpthread

all: tiny cgi

tiny: tiny.c ../csapp.h ../csapp.o
	$(CC) $(CFLAGS) -o tiny tiny.c ../csapp.o $(LIB)

cgi:
	(cd cgi-bin; make)

clean:
	rm -f *.o tiny *~
	(cd cgi-bin; make clean)

