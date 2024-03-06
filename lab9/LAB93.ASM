title to count the no of words and display in decimal format
.model small
.stack 100h
.data
para label byte
len db 40
act db ?
str db 40 DUP("$")
msg db "Enter a string to display $"
newline db 13,10,"$"
count db 0
.code
main proc
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg
int 21h
mov ah,0ah
lea dx,para
int 21h
lea si,str
mov cl,act
l2:
mov dl,[si]
cmp dl,' '
jne skip
inc count
skip:
inc si
loop l2
mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,10
int 21h
mov al,count
mov ah,0
mov cx,10
mov bx,0
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
