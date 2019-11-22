; Special chars
EOL equ 0           ; NUL terminator
CR  equ 0x0a        ; Newline (CR)
LF  equ 0x0d        ; Carriage return (LF)

MODE_TTY equ 0x0e   ; BIOS TTY text mode

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
