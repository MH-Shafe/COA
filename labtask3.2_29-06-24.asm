.model small
.stack 100h
.data 

msg1 db 0AH, 0DH, '$' 
msg2 db 0AH, 0DH, "Unknow$"

.code  
main proc
mov ax, @data
mov ds, ax


mov ah, 1
int 21h

cmp al, '1' 
je Display_o    
cmp al, '3'
je Display_o        

cmp al, '2'
je Display_e    
cmp al, '4'
je Display_e       

jmp Unknow   

Display_o: 
mov ah, 9
LEA dx, msg1    
int 21h
mov ah, 2
mov dl, 'o'    
int 21h
jmp exit

Display_e:
mov ah, 9
LEA dx, msg1    
int 21h
mov ah, 2
mov dl, 'e'    
int 21h
jmp exit
          
Unknow:
mov ah, 9
LEA dx, msg2    
int 21h
jmp exit

Exit:
mov ah, 4CH
int 21H   

