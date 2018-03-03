[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
    call clear_screen
    pusha
    mov edx, VIDEO_MEMORY
    mov ah, WHITE_ON_BLACK
print_string_pm_loop_begin:
    mov al, [ebx]
    cmp al, 0
    je print_string_pm_loop_end
    mov [edx], ax
    inc ebx
    add edx, 2
    jmp print_string_pm_loop_begin

print_string_pm_loop_end:
    popa
    ret

; clear screen to black
clear_screen:
    push ax
    mov ax, 0x0
    call fill_screen
    pop ax
    ret

; fill screen with color/character in ax
fill_screen:
    push edx
    mov edx, VIDEO_MEMORY
fill_screen_loop_begin:
    cmp edx, (VIDEO_MEMORY + 4000)
    je fill_screen_loop_end
    mov [edx], ax
    add edx, 2
    jmp fill_screen_loop_begin
fill_screen_loop_end:
    pop edx
    ret
