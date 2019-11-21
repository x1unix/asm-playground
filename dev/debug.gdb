# add-symbol-file ./build/mbr.elf 0x7c00
set architecture i8086
layout asm
set disassembly-flavor intel
br *0x7c00
target remote | qemu-system-i386 -S -gdb stdio -m 16 ./build/mbr.bin
conti