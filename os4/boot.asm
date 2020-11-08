[bits 16]
[org 0x7c00]

mov ax, 0
mov ss, ax
mov bp, 0xFFFF
mov sp, bp

jmp 0x00:boot_os

boot_os:

mov [boot_disk16], dl

    mov ah, 0x02
    mov bx, 0x7e00
    mov al, 4
    mov dl, [boot_disk16]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02
    int 0x13 ;CF set if fail

mov ax, [boot_disk16]
push ax

jmp 0x7e00

boot_disk16 db 0 
times 510-($-$$) db 0
db 0x55
db 0xaa