title to display the string at the center of the screen
.model small
.stack 100h
.data
para label byte
len db 60
act db ?
str db 60 DUP('$')
msg db "Enter string : $"
.code
main proc
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg
int 21h
mov ah,0Ah
lea dx,para
int 21h
mov ah,02h
mov dh,0Ch
mov dl,1Eh
int 10h
mov ah,09h
lea dx,str
int 21h
mov ah,4ch
int 21h
main endp
end
