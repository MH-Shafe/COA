.model small
.stack 100h
.data
msg1 DB "Enter a Capital Later: $"
msg2 db "In Small it is: $"  

cr equ 0Dh
nl equ 0Ah
a db ?
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
    
    mov ah, 2
    mov dl, a
    add dl, 20h
    int 21h
      
    main endp
end main
     