%include "print_string.s"

print_string_hex:
    pusha

    ; ax holds remainder
    mov ax, dx

    ; bx holds string pos
    mov bx, HEX_TEMPLATE
    ; move to end of string, least significant digits come first
    add bx, 5

print_string_hex_loop_begin:

    ; loop until we reach x in HEX_TEMPLATE
    cmp bx, HEX_TEMPLATE + 1
    je print_string_hex_loop_end

    ; copy lowe byte of remainder
    mov cl, al
    ; mask out 4 highest bits
    and cl, 0x0f

    ; decimal digits and characters are not contiguous in ASCII
    cmp cl, 10
    jge non_decimal
    add cl, '0'
    jmp branch_done
    non_decimal:
    add cl, 'a' - 10
branch_done:

    ; copy to string and subtract 1 from posistion
    mov [bx], cl
    dec bx
    ; divide remainder by 16
    shr ax, 4
    jmp print_string_hex_loop_begin

print_string_hex_loop_end:
    mov bx, HEX_TEMPLATE
    call print_string

    popa
    ret

HEX_TEMPLATE:
    db '0x0000', 0x0d, 0x0a, 0
