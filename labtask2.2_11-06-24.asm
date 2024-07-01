.model small
.stack 100h
.data
msg1 DB "Enter 1st Number : $" 
msg2 db "Enter 2st Number : $"        
msg3 db "Enter 3st Number : $"
msg4 db "Summation of $"
msg5 db " , $"
msg6 db " and $"
msg7 db " is $"

cr equ 0Dh
nl equ 0Ah
a db ? 
b db ?
c db ?

.code
main proc
    mov ax, @data 
    mov ds, AX
    
    mov ah, 9
    lea dx, msg1
    int 21H
    
    mov ah, 1
    int 21h   
    mov a, al
    
    mov ah, 2        
    mov dl, cr
    int 21h
    mov dl, nl
    int 21h
    
    mov ah, 9
    lea dx, msg2
    int 21H
    
    mov ah, 1
    int 21h   
    mov b, al
    
    mov ah, 2        
    mov dl, cr
    int 21h
    mov dl, nl
    int 21h
    
    mov ah, 9
    lea dx, msg3
    int 21H
    
    mov ah, 1
    int 21h   
    mov c, al
    
    mov ah, 2        
    mov dl, cr
    int 21h
    mov dl, nl
    int 21h
    
    mov bl, a
    mov bh, b
    add bh, bl
    mov bl, c
    add bh, bl
    sub bh, 60h
    
    mov ah, 9
    lea dx, msg4
    int 21H 
    
    mov ah, 2 
    mov dl, a
    int 21h
    
    mov ah, 9
    lea dx, msg5
    int 21H
    
    mov ah, 2 
    mov dl, b
    int 21h
    
    mov ah, 9
    lea dx, msg6
    int 21H 
    
    mov ah, 2 
    mov dl, c
    int 21h
    
    mov ah, 9
    lea dx, msg7
    int 21H
    
    mov ah, 2 
    mov dl, bh
    int 21h
      
    main endp
end main
     