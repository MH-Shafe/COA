.model small
.stack 100h
.data 

msg1 db 0AH, 0DH,"Capetal$"
msg2 db 0AH, 0DH,"Small$"
msg3 db 0AH, 0DH,"Unknow$"



.code  
main proc
mov ax, @data
mov ds, ax
mov cx, 5

mov ah, 1
int 21h
mov bh, al 

Capital:
cmp bh, 'A'
jl Unknow      
cmp bh, 'Z'
jg Small       
jmp Capital_letter

Small:
cmp bh, 'a'
jl Unknow    
cmp bh, 'z'
jg Unknow    
jmp Small_letter  

Capital_letter:
mov ah, 9
LEA dx, msg1    
int 21h
jmp exit

Small_letter:
mov ah, 9
LEA dx, msg2    
int 21h
jmp exit

Unknow:
mov ah, 9
LEA dx, msg3    
int 21h
jmp exit

Exit:
mov ah, 4CH
int 21H   

