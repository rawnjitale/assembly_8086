title to read and convert into upper case if it is in lower case
.model small
.stack 100h
.data
para label byte
len db 50
act db ?
str db 50 dup("$")
msg db "Enter the string $"
.code
main proc
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg
int 21h
lea dx,para
mov ah,0ah
int 21h
lea si,str
mov di,si
mov ch,00h
mov cl,act
back:mov al,[si]
cmp al,97
jb skip
cmp al,122
ja skip
sub al,32
mov [si],al
skip:
inc si
loop back
mov dl,0ah
mov ah,02h
int 21h
mov ah,09h
lea dx,str
int 21h
mov ah,4ch
int 21h
main endp
end
