[org 0x7c00]    ; Bootloader location as global memory offset

mov bx, msg     ; Put string address to bx
call print      ; Call custom "print" subroutine
jmp $           ; jump to current address = infinite loop

%include "print.s"

msg:
    db CR, LF, "!!! OMG, it works !!!", EOL

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 