.model small
.stack 100h
.data
msg1 DB "Enter a Number: $"
msg2 db "Given Input: $"  
msg db "hello World", 0Ah,0Dh,'$'
cr equ 0Dh
nl equ 0Ah
a db ?
.code
main proc
    mov ax, @data 
    mov ds, AX
    
    mov ah, 9
    lea dx, msg
    int 21H
    
    mov ah, 9
    lea dx, msg1
    int 21H
    
    mov ah, 1
    int 21h   
    mov a, al
    
    mov ah, 2        
    mov dl, cr; mov dl, 0Ah
    int 21h
    mov dl, nl; mov dl, 0Dh
    int 21h  
    
    mov ah, 9
    lea dx, msg2
    int 21H 
    
    mov ah, 2
    mov dl, a
    int 21h
      
    main endp
end main
     