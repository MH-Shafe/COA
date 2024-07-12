.model small
.stack 100h
.data 

msg1 db "Enter any number : $"
msg2 db 0AH, 0DH,"Error ! ",0AH, 0DH,'$'
msg3 db "Summation of 1st, 2nd and 3nd number is $", 0AH, 0DH,'$'
msg4 db 0AH, 0DH,'$'
a db ?
b db ?
c db ?
s db ?

.code   

main proc
mov ax, @data
mov ds, ax

input1:
mov ah, 9
lea dx, msg1
int 21h
mov ah, 1
int 21h
cmp al, '0'
jl Unknow1      
cmp al, '9'
jg Unknow1
mov a, al
mov ah, 9
lea dx, msg4
int 21h
jmp input2

input2:
mov ah, 9
lea dx, msg1
int 21h
mov ah, 1
int 21h
cmp al, '0'
jl Unknow2      
cmp al, '9'
jg Unknow2 
mov b, al
mov ah, 9
lea dx, msg4
int 21h
jmp input3

input3:
mov ah, 9
lea dx, msg1
int 21h 
mov ah, 1
int 21h
mov c, al
cmp al, '0'
jl Unknow3      
cmp al, '9'
mov b, al
jg Unknow3
mov ah, 9
lea dx, msg4
int 21h
jmp Sum  
  
Sum:  
mov bl, a
mov bh, b                      
add bh,bl
mov bl, c
add bh, bl 
sub bh, 60h
mov s, bh
jmp Show_Sum

Show_Sum:
mov ah, 9
lea dx, msg3
int 21h
mov ah, 2
mov dl, s   
int 21h   
jmp exit


Unknow1:
mov ah, 9
LEA dx, msg2    
int 21h
jmp input1

Unknow2:
mov ah, 9
LEA dx, msg2    
int 21h
jmp input2

Unknow3:
mov ah, 9
LEA dx, msg2    
int 21h
jmp input3


Exit:
mov ah, 4CH
int 21H   

