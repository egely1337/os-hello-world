GCC_FLAGS = -ffreestanding -m32 -g 
GCC = i386-elf-gcc 
ld = i386-elf-ld
nasm = nasm
grub = grub-mkrescue
qemu = qemu-system-x86_64

make:
	rm -rf iso/os_image.iso
	${GCC} ${GCC_FLAGS} -c src/main.c -o obj/main.o
	${nasm} src/multiboot.S -f elf32 -o obj/multiboot.o
	${ld} -T linker.ld
	${grub} -o iso/os_image.iso iso/
run:
	${qemu} iso/os_image.iso 