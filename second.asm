ORG 100h
.MODEL SMALL 

.DATA
c DW 0 
d DW 0
a DW 0

.CODE
MOV BX, 2 ; from 2 to BX
MOV AX, c ; AX -- result
; AX [ H-> 00000000, L->00000000 ]
 
IMUL BX ; DX not accounted

MOV BX, d
ADD ax, bx

MOV bx, 52
SUB ax, bx
MOV cx, ax ; CХ memory resister



mov ax,a   ; var a
mov bx,4


idiv bx 

add ax,1h


mov bx,ax
mov ax,cx
idiv bx