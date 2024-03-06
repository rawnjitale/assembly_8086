title
.model small
.stack 100h
.data
 num db ?
 msg db "Enter the number: $"

.code
main proc
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg
int 21h
mov ah,01h
lea dx,num
int 21h
cmp al,10
je display_sum
display_sum:
mov ch,0
mov ax,0
mov cl,num
l1:add ax,cx
cmp cx,00
je disp
jmp l1
disp:
mov bx,0
mov cx,10
back:
mov dx,0
div cx
add dx,30h
push dx
inc bx
cmp ax,0
ja back
mov ah,02h
mov cx,bx
l4:
pop dx
int 21h
loop l4

mov ah,4ch
main endp
end
