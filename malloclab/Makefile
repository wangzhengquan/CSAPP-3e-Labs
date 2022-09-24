#
# Students' Makefile for the Malloc Lab
#
TEAM = bovik
VERSION = 1
HANDINDIR = .


CC = gcc

INCLUDES += -I. -I./src
# preprocessor options 
CPPFLAGS += $(INCLUDES) 
# compilation options
CFLAGS += -Wall -g 
 


all: mdriver

mdriver: mdriver.c fsecs.c clock.c ftimer.c fcyc.c ./src/mm.c  ./src/memlib.c  


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



