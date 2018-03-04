disk_load:
    pusha
    push dx

    mov ah, 0x02
    ;al holds number of sectors to read
    mov al, dh

    ;dh holds head index (zero-based)
    mov dh, 0x00
    ;ch holds cylinder index (zero-based)
    mov ch, 0x00
    ;cl holds sector index (one-based)
    mov cl, 0x02

    ;BIOS disk read
    int 0x13

    jc disk_error
    pop dx
    cmp dh, al
    jne disk_error
    popa
    ret

disk_error:
    mov bx, ERROR_MSG
    call print_string
    mov dx, ax
    call print_string_hex
    jmp $

    ERROR_MSG db "Disk read error!", 0
