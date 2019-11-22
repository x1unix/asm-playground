[org 0x7c00]    ; Bootloader location as global memory offset

call cls

mov bx, hello     ; Put string address to bx
call print      ; Call custom "print" subroutine

mov bx, msg
call print

jmp $           ; jump to current address = infinite loop

%include "print.s"

hello:
    db "Hello World", CR, LF, EOL

msg:
    db "Wake up, neo", CR, LF, EOL

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 