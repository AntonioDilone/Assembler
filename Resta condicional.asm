
Data segment
     msg1 DB 10,13,"Digite un numero: $"
     msg2 DB 10,13,"Digite otro numero: $"
     msg3 DB 10,13,"Estos numeros no aplican$"
     msg4 DB 10,13,"El resultado es: $"
     res DB ?
Data ends

    Mostrar macro msg 
      LEA DX, msg              
      MOV AH,9H
      INT 21H
    Mostrar endm
        
code segment
    assume DS:Data,CS:code

start:
    MOV AX,Data
    MOV DS,AX   
    
    
    Mostrar msg1
    
    MOV AH,1H
    INT 21H
    
    SUB AL,30H
    MOV res,AL
    MOV AH,0
    
    Mostrar msg2
    
    MOV AH,1H
    INT 21H
    
    SUB AL,30H
    
    CMP res,AL
    JL C1
    
    JMP C2
    
    C1:
    Mostrar msg3
    JMP FINAL
           
    C2:
    SUB res,AL
    MOV AL,res
    AAM
    ADD AH,30H
    ADD AL,30H
    
    MOV BX,AX
    
    Mostrar msg4 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    JMP FINAL
    
    FINAL:
        MOV AH,4CH
        INT 21H 
ends
end start
    