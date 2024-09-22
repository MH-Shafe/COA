.model small
.stack 100h
.data  
msg1 db "Enter Binary Input : $"
msg2 db 0Ah, 0Dh, "Binary Out : $"
.code
main proc
    ;class ex1 
    ;count number of 1 in bx
    mov bx, 8Bh
    xor ax, ax
    mov cx, 16
    
    Loop_:
    rol bx,1
    jnc End
    inc ax
    End:
    loop Loop_
    
    ;class ex2 
    ;store in reverse order in al
    mov al, 0ACh
    mov cx, 8
    
    Reverse:
    shl al, 1
    rcr bl, 1
    loop Reverse    
    mov al, bl
    
    ;class ex3 
    mov ax,0h
    mov bx,0h
    mov cx,0h
    mov dx,0h                                 
    
    ;take binary input and print binary output
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah,1
    mov cx, 16
    
    input:
    int 21h 
    cmp al, 0dh
    je output
    
    sub al,30h
    shl bx, 1
    or bl,al
    loop input
    
    output:
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov cx, 16
    
    check:
    shl bx, 1
    jc ONE
    mov ah, 2
    mov dl, '0'
    int 21h
    jmp loop__
    
    ONE:
    mov ah, 2
    mov dl, '1'
    int 21h
    jmp loop__
    
    loop__:
    loop check
    
    
    
    
    
    
    
    