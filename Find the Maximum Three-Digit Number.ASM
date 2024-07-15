data segment
        Array dw 100,6,35,250,18,1000,180 ;Array of numbers
        sz dw 7 ; Size of the array
        MAX dw ? ; Variable to store the maximum value
data ends

code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov cx,sz ; Load the value of 'sz' from memory
        
check_max:
        cmp cx,0
        jle done
        dec cx
        mov si,cx 
        shl si,1 ;multiply index by 2 because word is 2 bytes
        mov bx,Array[si] ; Load the value of 'Array[cx]' from memory
        cmp bx,999     ;if bx <= 999 next num in array
        JGE check_max
        cmp bx,100    
        JBE check_max  ;if bx <= 100 next num in array
        cmp bx,MAX   
        JB check_max ;if BX < max
        mov MAX,bx   ;max = bx
        loop check_max  ;next num



done:        ;End the program
        mov ah,4Ch
        int 21h

code ends
end start
