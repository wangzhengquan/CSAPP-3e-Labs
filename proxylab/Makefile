# Makefile for Proxy Lab 
#
# You may modify this file any way you like (except for the handin
# rule). You instructor will type "make" on your specific Makefile to
# build your proxy from sources.

CC = gcc
CFLAGS = -g -Wall -I .
LDLIBS = -lpthread -lm

PROGS = proxy proxy1 proxy2 proxy3 proxy4
TESTS = hashtable_test cache_test

all: $(PROGS) $(TESTS)


proxy1: csapp.o csapp.h 

proxy2: csapp.o  csapp.h sbuf.o

proxy3: csapp.o csapp.h sbuf.o sbuf.h hashtable.o hashtable.h cache.o cache.h

proxy4: csapp.o csapp.h sbuf.o sbuf.h hashtable.o hashtable.h cache2.o cache2.h

proxy:  csapp.o csapp.h sbuf.o sbuf.h hashtable.o hashtable.h cache.o cache.h

hashtable_test: csapp.o csapp.h hashtable.o hashtable.h

cache_test: csapp.o csapp.h cache.o hashtable.o

#	$(CC) $(CFLAGS) proxy.o csapp.o -o proxy $(LDFLAGS)

# Creates a tarball in ../proxylab-handin.tar that you can then
# hand in. DO NOT MODIFY THIS!
handin:
	(make clean; cd ..; tar cvf $(USER)-proxylab-handin.tar proxylab-handout --exclude tiny --exclude nop-server.py --exclude proxy --exclude driver.sh --exclude port-for-user.pl --exclude free-port.sh --exclude ".*")

clean:
	rm -f *~ *.o proxy proxy1 proxy2 proxy3 *ore *.tar *.zip *.gzip *.bzip *.gz

