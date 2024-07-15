data segment
    Vec db 1, 18, 255, 6, 49, 48, 3, 254, 7 ; Array to store numbers
    N dw 9 ; Number of elements in Vec
    VecOneDig db 9 dup(0) ; Array to store one-digit numbers
    VecTwoDig db 9 dup(0) ; Array to store two-digit numbers
    VecThreeDig db 9 dup(0) ; Array to store three-digit numbers
    OneIndex dw 0 ; Index for VecOneDig
    TwoIndex dw 0 ; Index for VecTwoDig
    ThreeIndex dw 0 ; Index for VecThreeDig
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax
    mov cx, N         ; Load the value of 'N' from memory
    mov si, 0         ; Initialize SI to 0 for Vec index

Vecloop:
    mov al, Vec[si]   ; Load the current element of Vec into AL
    cmp al, 10
    jb OneDig         ; If less than 10, it is a one-digit number
    cmp al, 100
    jb TwoDig         ; If less than 100, it is a two-digit number
    jmp ThreeDig      ; Otherwise, it is a three-digit number

OneDig:
    mov di, OneIndex ; Load the current index of VecOneDig into DI
    mov VecOneDig[di], al  ; Store the element in VecOneDig
    inc OneIndex    ; Increment the index for VecOneDig
    jmp NextElement ; Jump to the next element

TwoDig:
    mov di, TwoIndex ; Load the current index of VecTwoDig into DI
    mov VecTwoDig[di], al ; Store the element in VecTwoDig
    inc TwoIndex        ; Increment the index for VecTwoDig
    jmp NextElement    ; Jump to the next element

ThreeDig:
    mov di, ThreeIndex ; Load the current index of VecThreeDig into DI
    mov VecThreeDig[di], al ; Store the element in VecThreeDig
    inc ThreeIndex      ; Increment the index for VecThreeDig

NextElement:
    inc si
    loop Vecloop      ; Continue looping until CX reaches 0

; Combine the sorted arrays back into Vec
    mov di, 0         ; Initialize DI to 0 for Vec index

; Copy two-digit numbers
CopyTwoDig:
    mov si, 0         ; Reset SI 
    mov cx, TwoIndex
CopyTwoLoop:
    jcxz CopyOneDig   ; if cx == 0 jump to CopyOneDig
    mov al, VecTwoDig[si]
    mov Vec[di], al  ; Copy the element into Vec
    inc si
    inc di
    loop CopyTwoLoop ; Continue looping until CX reaches 0

; Copy one-digit numbers
CopyOneDig:
    mov si, 0         ; Reset SI 
    mov cx, OneIndex
CopyOneLoop:
    jcxz CopyThreeDig ; if cx == 0 jump to CopyThreeDig
    mov al, VecOneDig[si] 
    mov Vec[di], al ; Copy the element into Vec
    inc si
    inc di
    loop CopyOneLoop ; Continue looping until CX reaches 0

; Copy three-digit numbers
CopyThreeDig:
    mov si, 0         ; Reset SI 
    mov cx, ThreeIndex
CopyThreeLoop:
    jcxz done         ; if cx == 0 jump to done
    mov al, VecThreeDig[si]
    mov Vec[di], al ; Copy the element into Vec
    inc si
    inc di
    loop CopyThreeLoop ; Continue looping until CX reaches 0

done:                ; End the program
    mov ah, 4Ch
    int 21h

code ends
end start
