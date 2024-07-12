.model small
.stack 100h
.data 

msg0 db 0AH, 0DH,"Number", 0AH, 0DH,'$'
msg1 db 0AH, 0DH,"Capetal", 0AH, 0DH,'$'
msg2 db 0AH, 0DH,"Small", 0AH, 0DH,'$'
msg3 db 0AH, 0DH,"Unknow",0AH, 0DH,'$'
msg4 db "give an input : $"
msg5 db 0AH, 0DH, '$'

.code  
main proc
mov ax, @data
mov ds, ax

input:
mov ah, 9
lea dx, msg4
int 21h
mov ah, 1
int 21h
mov bh, al 

Number:
cmp bh, '0'
jl Unknow      
cmp bh, '9'
jg Capital       
jmp Num

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

Num:
mov ah, 9
LEA dx, msg0    
int 21h
jmp input

Capital_letter:
mov ah, 9
LEA dx, msg1    
int 21h
jmp input

Small_letter:
mov ah, 9
LEA dx, msg2    
int 21h
jmp input

Unknow:
mov ah, 9
LEA dx, msg3    
int 21h
jmp input

Exit:
mov ah, 4CH
int 21H   

