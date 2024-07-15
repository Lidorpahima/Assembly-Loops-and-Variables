data segment
    str1 db "London is the capital of Great Britain.$" ; Input string
    str2 db 20 dup(?) ; 20 bytes for the longest word
    firstWord db 20 dup(?); will store the first word
    lastWord db 20 dup(?) ; will store the last word
data ends

code segment
    assume cs:code,ds:data
start:
    mov ax, data
    mov ds, ax
    mov si, 0
    mov di, 0

; Copy first word
firstwords:    
    mov al, str1[si] ; Get the character
    cmp al, ' ' ; Check if it is a space so will move to the next word
    je nextword 
    cmp al, '$' ; Check if it is the end of the string
    je done 
    mov firstWord[di], al ; Copy the character to the first word
    inc si ; Move to the next character
    inc di ; Move to the next character 
    jmp firstwords

nextword:
    mov firstWord[di], '$' ; End of first word
    mov si, 0
    mov di, 0

; Find last word
findlastword: 
    mov al, str1[si] ; Get the character
    cmp al, '$' ; Check if it is the end of the string
    je copylastword ; If it is the end of the string, copy the last word
    cmp al, ' ' ; Check if it is a space
    jne notspace ; If it is not a space, move to the next character
    mov di, si ;will store every space position 
notspace:
    inc si ; Move to the next character
    jmp findlastword ; Repeat the process until the end of the string

copylastword:
    inc di
    mov si, di
    mov di, 0

copylast:
    mov al, str1[si] ; Get the character
    cmp al, '$' ; Check if it is the end of the string
    je insertStr2 ; If it is the end of the string, insert the last word to str2
    mov lastWord[di], al ; Copy the character to the last word
    inc si
    inc di
    jmp copylast ; Repeat the process until the end of the string

insertStr2:
    mov lastWord[di], '$' ; End of last word
    mov si, 0
    mov di, 0

; Copy first word to str2
copyFirstToStr2:
    mov al, firstWord[si] ; Get the character
    cmp al, '$' ; Check if it is the end of the string
    je copySpace ; If it is the end of the string, copy space to str2
    mov str2[di], al ; Copy the character to str2
    inc si
    inc di
    jmp copyFirstToStr2 ; Repeat the process until the end of the string

copySpace:
    mov al, ' ' ; Copy space to str2
    mov str2[di], al ; Copy the character to str2
    inc di ; Move to the next character
    mov si, 0 ; Reset si

; Copy last word to str2
copyLastToStr2:
    mov al, lastWord[si] ; Get the character
    cmp al, '$' ; Check if it is the end of the string
    je done
    mov str2[di], al ; Copy the character to str2
    inc si
    inc di
    jmp copyLastToStr2 ; Repeat the process until the end of the string

done:        ; End the program
    mov ah, 4Ch
    int 21h

code ends
end start