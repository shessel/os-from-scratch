[org 0x7c00]
    mov bp, 0x9000
    mov sp, bp

    mov bx, START_MSG
    call print_string

    call switch_to_pm

%include "print_string.s"
%include "print_string_pm.s"
%include "switch_to_pm.s"

[bits 32]
main:
    mov ebx, MSG_32_BIT
    call print_string_pm
    jmp $

START_MSG db "Starting in 16 bit", 0
MSG_32_BIT db "Continueing in 32 bit", 0

times 510 - ($-$$) db 0
dw 0xaa55
