
.model small
.stack 100h
.data
vowelCount dw 0
vowelList db 'AEIOUaeiou$'
inputMsg db "Enter a string: $"
outputMsg db 13,10,"Number of vowels: $"
para label byte
max db 40
act db ?
inputBuffer db 40 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display input prompt
    mov ah, 09h
    lea dx, inputMsg
    int 21h

    ; Read input string
    mov ah, 0ah
    lea dx,para
    int 21h

    ; Calculate vowel count
    mov si, offset inputBuffer+1   ; Point SI to start of input string
    mov cl,act
    mov ch,00          ; CX = length of input string
    mov vowelCount, 0              ; Initialize vowel count to 0

countVowels:
    mov al, [si]                   ; Load character into AL
    cmp al, '$'                    ; Check for end of string
    je endCounting

    ; Check if the character is a vowel
    mov di, offset vowelList
    call findVowel
    cmp al, 1                      ; If AL = 1, it's a vowel
    je incrementCount

    ; Move to the next character
    inc si
    loop countVowels

incrementCount:
    inc vowelCount                 ; Increment vowel count
    inc si                         ; Move to the next character
    jmp countVowels

endCounting:
    ; Display the vowel count
    mov ah, 09h
    lea dx, outputMsg
    int 21h

    mov ax, vowelCount
    call displayNumber

    ; Exit program
    mov ah, 4ch
    int 21h

main endp

findVowel proc
    ; Input: AL = character to check
    ;        DI = offset of vowelList
    ; Output: AL = 1 if character is a vowel, 0 otherwise

    mov ah, 0                      ; Clear AH
    mov cx, 10                     ; Loop counter
checkVowel:
    mov dl, [di]                   ; Load vowel from the list
    cmp al, dl                     ; Compare character with vowel
    je isVowel                     ; If equal, set AL = 1
    inc di                         ; Move to next vowel
    loop checkVowel
    mov al, 0                      ; If no match found, set AL = 0
    ret

isVowel:
    mov al, 1                      ; Set AL = 1 (vowel found)
    ret

findVowel endp

displayNumber proc
    ; Input: AX = number to display
    ; Output: Displays the number

    push ax                        ; Save AX
    mov bx, 10                     ; Base 10 for division
    xor cx, cx                     ; CX = 0 (counter for number of digits)

    ; Loop to count number of digits
countDigits:
    xor dx, dx                     ; Clear DX
    div bx                         ; Divide AX by 10
    push dx                        ; Push remainder (digit) onto stack
    inc cx                         ; Increment digit count
    test ax, ax                    ; Check if quotient is zero
    jnz countDigits                ; If not zero, continue loop

    ; Loop to display digits in reverse order
displayDigits:
    pop dx                         ; Pop digit from stack
    add dl, '0'                    ; Convert digit to ASCII character
    mov ah, 02h                    ; AH = 02h (function to display character)
    int 21h                        ; Display character
    loop displayDigits             ; Loop until all digits displayed

    pop ax                         ; Restore AX
    ret

displayNumber endp

end
