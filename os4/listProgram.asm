mov ax, 0x800
mov ds, ax

pop ax ;bringing return seg from stack
mov [returnSeg], ax

pop ax ;bringing return offset from stack

mov [returnTo], ax

mov ax, [returnSeg]
mov dx, ax
xor cx, cx
xor bx, bx
call hprint
call newLine

mov ax, [returnTo]
mov dx, ax
xor cx, cx
xor bx, bx
call hprint
call newLine

mov si, listHW
call sprint

mov ax, ds
mov dx, ax
xor cx, cx
xor bx, bx
call hprint
call newLine

push ds

mov ax, [returnSeg]
push ax
mov ax, [returnTo]
push ax
retf

jmp $

%include 'print16.asm'
listHW db 'FAR JUMP TO SEGMENT ', 0
returnTo dw 0
returnSeg dw 0