
Data segment
    msg0 DB "Lactante Menor$"
    msgM DB "Lactante Mayor$"
    msgP DB "Pre escolar$"
    msgI DB "Infancia media$"
    msgInicio DB "Cual es la edad del nino?$"
ends

Code segment
    Assume cs:Code, ds:Data
start:

MOV AX,Data
MOV DS,AX

LEA DX,msgInicio
MOV AH,9H
INT 21H

MOV AH,1H
INT 21H

CMP AL,"0"
JE C1

CMP AL,"1"
JE C2

CMP AL,"2"
JE C2

CMP AL,"3"
JE C3

CMP AL,"4"
JE C3

CMP AL,"5"
JGE  C4

C1:MOV AH,9H
   LEA DX,msg0
   INT 21H
   JMP FINAL
  
C2:MOV AH,9H
   LEA DX,msgM
   INT 21H
   JMP FINAL

C3:MOV AH,9H
   LEA DX,msgP
   INT 21H
   JMP FINAL

C4:MOV AH,9H
   LEA DX,msgI
   INT 21H
   JMP FINAL
   
FINAL: MOV AH,4CH
       INT 21H
Code ends
end start
