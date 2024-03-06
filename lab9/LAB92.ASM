title to read and calculate the givenseries of number
.model small
.stack 200h
.data
num db 0
sum dw 0
.code
main proc
mov ax,@data
mov ds,ax
start:
mov ah,01h
int 21h
cmp al,0dh
je lp
sub al,30h
push ax
mov al,10
mul num
pop ax
add num,al
jmp start
lp:
mov ch,0
mov cl,num
mov al,02
mov ah,00
mov dl,02
calculate:
ROL al,1
mul dl
add sum,ax
inc dl
mov al,dl
loop calculate

mov ax,sum
mov bx,0
mov cx,10
l1:
mov dx,0
div cx
add dx,30h
push dx
inc bx
cmp ax,0
ja l1
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
