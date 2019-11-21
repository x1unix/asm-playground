[org 0x7c00] ; Define BIOS MBR memory start offset as global memory offset
EOL equ 0 ; NUL terminator

mov ah, 0x0e ; tty mode

mov bx, msg  ; Put string address to bx

print:
    mov al, [bx]    ; Take value from bx address to al
    int 0x10        ; Print interrupt
    inc bx          ; Increate pointer to get next char
    cmp al, EOL     ; Print next char if it's not null terminator
    jne print

jmp $ ; jump to current address = infinite loop

msg:
    db 10, 13, "!!! OMG, it works !!!", EOL

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 