BUILD_DIR ?= ./build
SRC ?= ./src
MBR ?= $(BUILD_DIR)/mbr.bin
QEMU ?= qemu-system-i386

.PHONY:mbr
mbr:
	nasm -f bin $(SRC)/mbr/mbr.s -o $(BUILD_DIR)/mbr.bin

.PHONY:mbr
run: mbr
	$(QEMU) $(MBR) -s

.PHONY:mbr
debug: mbr
	gdb -x ./dev/debug.gdb

.PHONY:mbr
rdr:
	radare2 $(BUILD_DIR)/mbr.bin