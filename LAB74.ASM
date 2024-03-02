title to read string using character reading function
.model small
.stack 100h
.data
str db 50 dup("$")
.code
main proc
mov ax,@data
mov ds,ax
lea si,str
mov di,si
mov ah,01h
back:
int 21h
cmp al,0dh
jz display
mov [si],al
inc si
loop back

display:

mov ah,02h
mov dl,[di]
cmp dl,'$'
jz end_program
inc di
int 21h
jmp display
end_program:
mov ah,4ch
int 21h
main endp
end

