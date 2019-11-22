; Special chars
EOL equ 0           ; NUL terminator
CR  equ 0x0a        ; Newline (CR)
LF  equ 0x0d        ; Carriage return (LF)

MODE_TTY equ 0x0e   ; BIOS TTY text mode

; cls clears (or tries at least) the screen
cls:
    pusha

    mov ax, 0x0700  ; function 07, AL=0 means scroll whole window
    mov bh, 0x07    ; character attribute = white on black
    mov cx, 0x0000  ; row = 0, col = 0
    mov dx, 0x184f  ; row = 24 (0x18), col = 79 (0x4f)
    int 0x10        ; call BIOS video interrupt

    popa
    ret


; Print prints the string to stdout
;
; Parameters:
;
; bx - string address
print:
    pusha               ; Save registers to stack
    cmp ah, MODE_TTY    ; Set TTY Mode once
    je __print_ptr
    mov ah, MODE_TTY

__print_ptr:
    mov al, [bx]    ; Take value from bx address to al
    cmp al, EOL     ; Stop if char is null terminator
    je __print_done

    int 0x10        ; Print interrupt
    inc bx          ; Increate pointer to get next char
    jmp __print_ptr ; Print next char

__print_done:
    popa                ; Restore registers & flags
    ret
