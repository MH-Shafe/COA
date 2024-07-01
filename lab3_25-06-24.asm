.model small
.stack 100h
.data 

msg db "hello world", 0AH, 0DH, '$'
msg1 db "Bye World" , 0AH, 0DH, '$'

m1 db "Positive $"
m2 db "Negative $"
m3 db "Zero $"
.code  
main proc
mov ax, @data
mov ds, ax
mov cx, 5

L5: 
mov ah, 9
LEA dx, msg
int 21H
DEC cx

JNZ L5
mov ah, 9
LEA DX, msg1
int 21H

mov bl, '2'
mov bh, '6'
cmp bl, bh
jg L1      ; jump greater then
jl L2      ; jump less then
jmp L3     ; jamp to L3

L1:
mov AH, 2
mov DL, BL
int 21H
;jmp Exit
L2:
mov AH, 2
mov DL, Bh
int 21H   
;jmp Exit

L3:
mov AH, 2
mov DL, 'e'
int 21H          

       

mov ah, 1
int 21h
cmp al, '0'
jg Pos_
jl Neg_
jmp Equal
 
 Pos_:
 mov ah, 9
 lea dx, m1
 int 21h
; jmp Exit
 
 Neg_:  
 mov ah, 1   ; to get negtive input  
 int 21h
 mov ah, 9
 lea dx, m2
 int 21h
; jmp Exit
  
 Equal:
 mov ah, 9
 lea dx, m3
 int 21h
 
 ; mov ah, 1
 ;int 21h
 ;mov dl,al
 ;cmp dl, 'A'
 ;jg Check   
 ;
 
 ;Check:
 ;cmp dl,'Z'
 ;jle Print
 
 ;Print:
 ;mov ah, dl
 ;int 21h
 
    
    
    
    
    
    
Exit:
mov ah, 4CH
int 21H