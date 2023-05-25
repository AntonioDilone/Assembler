
Data segment
    msg1 DB "Mi nombre es Antonio. Mi edad es:$"
Data ends

Code segment

assume DS:Data, CS:Code
start:

MOV AX,Data
MOV DS,AX

MOV AH,9H
LEA DX,msg1
INT 21H

MOV AH, 2H
MOV DL, '2'
INT 21H

MOV DL, '1'
INT 21H

MOV AX,4CH
INT 21H

Code ends
end start

