[org 0x7e00]

call getInitVideoMode
call setInitVideoMode
call clearScreen

mov si, bdStr
call sprint

pop ax
mov dx, ax
xor cx, cx
xor bx, bx
call hprint
call newLine

mov ax, sprint
mov dx, ax
xor cx, cx
xor bx, bx
call hprint

mov si, strpStr
call sprint
call newLine

mov ax, hprint
mov dx, ax
xor cx, cx
xor bx, bx
call hprint

mov si, hpStr
call sprint
call newLine

int 0x12

mov ax, ss
mov dx, ax
xor cx, cx
xor bx, bx
call hprint

mov si, ssStr
call sprint
call newLine

mov ax, bp
mov dx, ax
xor cx, cx
xor bx, bx
call hprint

mov si, bpStr
call sprint
call newLine

mov ax, ds
mov dx, ax
xor cx, cx
xor bx, bx
call hprint

mov si, dsStr
call sprint
call newLine

mov ax, 0x0800
mov es, ax
mov ds, ax
    mov ah, 0x02
    mov bx, 0x0000
    mov al, 2 ;segments to load
    mov dl, 0x01
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x01
    int 0x13 ;CF set if fail

push fromKernel
push cs

jmp 0x0800:0x0000

fromKernel:
    mov ax, 0
    mov ds, ax

    mov si, kernStr
    call sprint

    pop ax
    mov dx, ax
    xor cx, cx
    xor bx, bx
    call hprint
jmp $

%include 'print16.asm'

kernStr db 'RESPONSE FROM ', 0
times 2048-($-$$) db 0