#!/bin/sh
cd "$(dirname "$0")"
nasm cencrypt.asm -o cencrypt.o -f macho64
clang main.c cencrypt.o -O2 -o qmc-tool-osx
rm -f cencrypt.o
