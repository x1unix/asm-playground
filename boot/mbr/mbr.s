; start loop
mov cl, 0

mov ah, 0x0e ; tty mode
print:
mov al, 'F'
int 0x10
mov al, 'U'
int 0x10
mov al, 'C'
int 0x10
mov al, 'K'
int 0x10
mov al, ' '
int 0x10

inc cl
cmp cl, 3 ; if (cx <= 3)
jle print

mov al, '!'
int 0x10
int 0x10
int 0x10

jmp $ ; jump to current address = infinite loop

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 