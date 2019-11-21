BUILD_DIR ?= ./build
MBR ?= $(BUILD_DIR)/mbr.bin
QEMU ?= qemu-system-i386

.PHONY:mbr
mbr:
	nasm -f bin ./boot/mbr/mbr.s -o $(BUILD_DIR)/mbr.bin

run: mbr
	$(QEMU) $(MBR)