title to input number
.model small
.stack 200h
.data
count db 0
num db 0
sum dw 0
.code
main proc
mov ax,@data
mov ds,ax
mov cx,03h
mov si,offset num
;reading a number from user input
l1:
mov ah,01h
int 21h
cmp al,0dh
je lp
sub al,30h
push ax
mov al,10
mul num
mov num,al
pop ax
add num,al
inc count
jmp l1
lp:
mov bh,00
mov bl,num
calculate:
add sum,bx
dec bx
jnz calculate
mov cx,10
mov ax,sum
mov bx,0
l4:
mov dx,0
div cx
add dx,30h
push dx
inc bx
cmp ax,0
ja l4
mov ah,02h
mov cx,bx
display:
pop dx
int 21h
loop display

mov ah,4ch
int 21h
main endp
end
