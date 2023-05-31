Data segment
    Num1 DB ?
    Num2 DB ?
    Resultado DB ?
    M1 DB 10,13,"Digite el primer numero: $"
    M2 DB 10,13,"Digite el segundo numero: $"
    M3 DB 10,13,"El resultado de la suma es: $"
ends

Cod segment
    assume DS: Data, CS:Cod

start:
    MOV AX,Data
    MOV DX,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV Num1,AL
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV Num2,AL
    
    MOV AH,0
    MOV AL,Num1
    mul Num2
    MOV Resultado,AL
    
    
    AAM
    ADD AH,30H
    ADD AL,30H
    
    MOV BX,AX
    
    LEA DX,M3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
Ends
end start
    