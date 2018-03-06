[org 0x7c00]
KERNEL_OFFSET equ 0x1000

    mov [BOOT_DRIVE], dl

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_BOOTING_REAL
    call print_string

    call load_kernel
    call switch_to_pm

    jmp $

%include "disk_load.s"
%include "print_string_hex.s"
%include "print_string_pm.s"
%include "switch_to_pm.s"

[bits 16]
load_kernel:
    mov bx, MSG_KERNEL_LOAD
    call print_string

    mov bx, KERNEL_OFFSET
; read one sector, qemu fails if trying to load more than image provides
    mov dh, 0x02
    mov dl, [BOOT_DRIVE]
    call disk_load

    ret

[bits 32]
main:
    mov ebx, MSG_PM_BEGIN
    call print_string_pm

    call KERNEL_OFFSET

    jmp $

BOOT_DRIVE db 0
MSG_PM_BEGIN db "Begin Protected Mode", 0
MSG_KERNEL_LOAD db "Loading Kernel", 0
MSG_BOOTING_REAL db "Booting in Real Mode", 0

times 510 - ($ - $$) db 0
dw 0xaa55
