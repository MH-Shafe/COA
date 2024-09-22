.model small
.data
.code
MAIN PROC 
    ;DISPLAY ?
    MOV AH,2
    MOV DL,'?'
    INT 21H
    ;CLEAR THE COUNTER REGISTER
    XOR CX,CX                  
    
    ;TAKING USER INPUT
    MOV AH,1
    INT 21H
    
    WHILE_:
    CMP AL, 0DH
    JE END_WHILE_
    PUSH AX
    INC 
    ;NEW LINE
    END_WHILE_
     
    