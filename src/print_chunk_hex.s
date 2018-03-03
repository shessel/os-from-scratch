print_chunk_hex:
    pusha
    mov bx, ax
    mov dx, cx

    print_chunk_hex_loop_begin:
    cmp dx, 0x00
    je print_chunk_hex_loop_end
    mov cx, [bx]

    mov al, ch
    shr al, 4
    call print_hex_digit

    mov al, ch
    and al, 0x0f
    call print_hex_digit

    mov al, cl
    shr al, 4
    call print_hex_digit

    mov al, cl
    and al, 0x0f
    call print_hex_digit

    mov al, 0x20
    mov ah, 0x0e
    int 0x10

    add bx, 2
    dec dx
    jmp print_chunk_hex_loop_begin
    print_chunk_hex_loop_end:

    popa
    ret

print_hex_digit:
    cmp al, 10
    jge print_hex_digit_non_decimal
    add al, '0'
    jmp print_hex_digit_branch_done
    print_hex_digit_non_decimal:
    add al, 'a' - 10
    print_hex_digit_branch_done:

    mov ah, 0x0e
    int 0x10
    ret
