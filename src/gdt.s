GDT_BEGIN:
GDT_NULL:
    dd 0x0
    dd 0x0
GDT_CODE:
    dw 0xffff ; segment limit 15:0
    dw 0x0 ; base address 15:0
    db 0x0 ; base 23:16
    db 10011010b ; present, privilege 1:0, descriptor type, segment type 3:0
    db 11001111b ; granularity, default op size, 64-bit, available for sys, segment limit 19:16
    db 0x0 ; base address 31:24
GDT_DATA:
    dw 0xffff ; segment limit 15:0
    dw 0x0 ; base address 15:0
    db 0x0 ; base 23:16
    db 10010010b ; present, privilege 1:0, descriptor type, segment type 3:0
    db 11001111b ; granularity, default op size, 64-bit, available for sys, segment limit 19:16
    db 0x0 ; base address 31:24
GDT_END:

GDT_DESCRIPTOR:
    dw GDT_END - GDT_BEGIN - 1
    dd GDT_BEGIN

CODE_SEG equ GDT_CODE - GDT_BEGIN
DATA_SEG equ GDT_DATA - GDT_BEGIN
