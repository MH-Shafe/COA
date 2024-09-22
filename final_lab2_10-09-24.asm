.model small
.stack 100h
.data  
msg1 db "Enter Hexa Input : $"
msg2 db 0Ah, 0Dh, "Hexa Out : $"
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah,1
    mov cx, 4
    
    input:
    int 21h 
    cmp al, 0dh
    je output 
    
    cmp al,41h
    jge LatterInput
    
    sub al,30h
    shl bx, 4
    or bl,al
    loop input
    
    LatterInput:
    sub al, 37h
    shl bx,4
    or bl,al
    loop input
    
    output:
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov cx, 4
    
    check:
    mov dl,bh
    shr dl,4

    
    cmp dl, 0AH
    jge LatterOutPut
    JMP DIGITOUTPUT
    
    DIGITOUTPUT:
    add dl,30h
    mov ah, 2
    int 21h
    rol bx, 4
    JMP loop__
    
    LatterOutPut:
    add dl,37h
    mov ah, 2
    int 21h
    rol bx, 4
    JMP loop__
    
    loop__:
    loop check
    
    
    
    
    
    
    
    