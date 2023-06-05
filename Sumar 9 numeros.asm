DATO SEGMENT
    Mesg DB 10,13,"Programa que captura 9 numeros y los suma $"
    Mesg2 DB 10,13,"Introduzca un numero: $"
    Mesg3 DB 10,13,"La sumatoria de esos numeros es: $"
    Num DB ?
    Result DB 0  
DATO ends

Mostrar macro msg
    LEA DX,msg
    MOV AH,9H
    INT 21H
Mostrat endm

Sumar macro num
     ADD Result,AL
     MOV AH,0
    Sumar endm 

Codigo segment
    assume DS:DATO,CS:Codigo
    
start:    
    MOV AX,DATO
    MOV DS,AX
    MOV CX,9
    
    LEA DX,Mesg
    MOV AH,9H
    INT 21H
    
    repeat:
    Mostrar Mesg2
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV Num,AL
    
    Sumar Num
    ADD BX,AX

    Loop repeat
    ADD BH,30H
    ADD BL,30H
    
    Mostrar Mesg3
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    

    
ENDS
end start      