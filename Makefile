build:
	nasm src/boot.asm -o boot
run:
	qemu-system-x86_64 boot
all: build run
