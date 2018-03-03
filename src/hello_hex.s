;
; A boot sector that prints a string using our function.
;
[org 0x7c00] ; Tell the assembler where this code will be loaded
mov dx, 0x1fb6 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0xffff ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0xfffe ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0x1337 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0xdead ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0x0018 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0xf000 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0x0600 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0x00c0 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0x0001 ; store the value to print in dx
call print_string_hex ; call the function
mov dx, 0x0000 ; store the value to print in dx
call print_string_hex ; call the function
jmp $ ; Hang
%include "print_string_hex.s"

; Padding and magic number.
times 510-($-$$) db 0
dw 0xaa55
