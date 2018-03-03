[org 0x7c00] ; Tell the assembler where this code will be loaded
    mov bp, 0x8000
    mov sp, bp

    mov [BOOT_DISK], dl
    mov dh, 0x02

    mov bx, 0x0000
    mov es, bx
    mov bx, 0x9000
    call disk_load

    mov ax, 0x0200
    loop_begin:
    mov dx, [0x9000]
    call print_string_hex

    mov dx, [0x9200]
    call print_string_hex

    mov cx, 0x200
    mov ax, 0x9000
    call print_chunk_hex

    jmp $

    %include "print_string_hex.s"
    %include "print_chunk_hex.s"
    %include "disk_load.s"

    ; Padding and magic number.
    BOOT_DISK db 0

    times 510-($-$$) db 0
    dw 0xaa55
    times 256 dw 0xaffe
    times 256 dw 0xbaa1
