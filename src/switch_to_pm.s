[bits 16]
switch_to_pm:
    cli ; switch off interrupts

    lgdt [GDT_DESCRIPTOR] ; load gdt descriptor
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax ; set first bit of cr0 to 1 to make the switch to 32-bit protected mode
    jmp CODE_SEG:init_pm

[bits 32]
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp
    jmp main

%include "gdt.s"
