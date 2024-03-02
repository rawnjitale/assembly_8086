title to display the word in new line
.model small
.stack 200h
.data
para label byte
len db 50
act db ?
str db 50 dup('$')
msg db "Enter the string $"
.code
main proc
mov ax,@data
mov ds,ax
;to show the display message
mov ah,09h
lea dx,msg
int 21h

mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,10
int 21h
lea dx,para
mov ah,0ah
int 21h
;code for displaying the each word in new line
mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,10
int 21h
lea si,str
back:mov dl,[si]
cmp dl,32
je newline
cmp dl,'$'
je end_program
int 21h
inc si
jmp back
newline:
mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,10
int 21h
inc si
jmp back
end_program:
mov ah,4ch
int 21h
main endp
end
