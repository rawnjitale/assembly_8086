title to read string and display each word in each line of the center of the screen
.model small
.stack 200h
.data
para label byte
len db 24
act db ?
str db 24 dup("$")
msg db "Enter string 24(max char): $"
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
mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dh,0Ch ;row 
mov dl,27h ;column 
lea si,str
mov cl,dl
back:mov ah,02h
mov dl,cl
int 10h
mov ah,02h
mov dl,[si]
int 21h
inc si
inc dh
cmp byte ptr [si],'$'
JE end_program
JMP back
end_program:
mov ah,4ch
int 21h
main endp
end
