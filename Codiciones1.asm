
Data segment
    msgA DB "-Aprobado$"
    msgB DB "-Bueno$"
    msgC DB "-Calificado$"
    msgF DB "-Reprobado$"
    msg DB "Digite una nota: $"
ends

Code segment
    Assume cs:Code, ds:Data
start:

MOV AX,Data
MOV DS,AX

LEA DX,msg
MOV AH,9H
INT 21H

MOV AH,1H
INT 21H

CMP AL,"A"
JE C1

CMP AL,"B"
JE C2

CMP AL,"C"
JE C3
JMP C4

C1:MOV AH,9H
   LEA DX,msgA
   INT 21H
   JMP FINAL  

C2:MOV AH,9H
   LEA DX,msgB
   INT 21H
   JMP FINAL  

C3:MOV AH,9H
   LEA DX,msgC
   INT 21H
   JMP FINAL

C4:MOV AH,9H
   LEA DX,msgF
   INT 21H
   JMP FINAL

FINAL: MOV AH,4CH
       INT 21H
Code ends
end start
