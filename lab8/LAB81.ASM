title to display and scroll the window
.model small
.stack 200h
.data
str db "Programming is Assembly is Fun $"
.code
main proc
mov ax,@data
mov ds,ax
mov ah,06h
mov cx,0514h
mov dx,143Ch
mov bh,71h
int 10h

mov ah,02h
mov bh,00h
mov dl,1Eh
mov dh,0Ch
int 10h
mov ah,09h
lea dx,str
int 21h
mov ah,4ch
int 21h
main endp
end
