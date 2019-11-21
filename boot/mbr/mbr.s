MBR_MEM_OFFSET equ 0x7c00 ; BIOS MBR memory start offset
EOL equ 0 ; NUL terminator

mov ah, 0x0e ; tty mode
mov cx, 0 ; start loop

mov bx, msg
add bx, MBR_MEM_OFFSET ; 0x7c00

print:
    mov al, [bx]    ; Take value from bx address to al
    int 0x10        ; Print interrupt
    inc bx          ; Increate pointer to get next char
    cmp al, EOL     ; Print next char if it's not null terminator
    jne print

jmp $ ; jump to current address = infinite loop

msg:
    db 10, 10, "!!! OMG, it works !!!", 0

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 