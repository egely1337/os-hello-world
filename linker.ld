OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

ENTRY(main)

INPUT(
    obj/multiboot.o
    obj/main.o
)

OUTPUT(
    iso/boot/kernel.elf
)


SECTIONS
{
    . = 0x8000;

    .text : ALIGN(0x1000){
       *(.multiboot)
        *(.text)
    }

    .data : ALIGN(0x1000){
        *(.data)
    }
    .rodata : ALIGN(0x1000) {
        *(.rodata)
    }

    .bss : ALIGN(0x1000){
        *(COMMON)
        *(.bss)
    }
}