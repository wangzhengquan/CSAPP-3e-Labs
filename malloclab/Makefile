#
# Students' Makefile for the Malloc Lab
#
TEAM = bovik
VERSION = 1
HANDINDIR = .

CC = gcc
CFLAGS = -Wall -g -m64

OBJS = mdriver.o  memlib.o fsecs.o fcyc.o clock.o ftimer.o

all: mdriver

mdriver: $(OBJS) mm.o
	$(CC) $(CFLAGS) -o mdriver $(OBJS) mm.o

mdriver.o: mdriver.c fsecs.h fcyc.h clock.h memlib.h config.h mm.h
memlib.o: memlib.c memlib.h
mm.o: mm.c mm.h memlib.h
mm1.o: mm1.c mm.h memlib.h
fsecs.o: fsecs.c fsecs.h config.h
fcyc.o: fcyc.c fcyc.h
ftimer.o: ftimer.c ftimer.h config.h
clock.o: clock.c clock.h

handin:
	cp mm.c $(HANDINDIR)/$(TEAM)-$(VERSION)-mm.c

clean:
	rm -f *~ *.o mdriver



#############################################################
# Use these rules to switch back and forth between different
# versions of mm.c. E.g., "make implicit" installs the
# implicit list malloc package described in the CS:APP text.
#############################################################

implicit: # implicit list version
	rm -f mm.c mm.o; ln -s mm-implicit.c mm.c

explicit: # explicit list version
	rm -f mm.c mm.o; ln -s mm-explicit.c mm.c

seglist: # segmented list version
	rm -f mm.c mm.o; ln -s mm-seglist.c mm.c


