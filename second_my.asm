ORG 100h
.MODEL SMALL

.DATA
c DW -1
d DW 1
a DW 6 
result DW 0

.CODE
; c/d
mov ax, c
cwd 
idiv d ; AX = c/d
mov bx, ax ; BX = c/d

; 3*a/2
mov ax, a
mov cx, 3
imul cx; AX = 3*a

cwd 
mov cx, 2
idiv cx ; AX = 3*a/2


add ax, bx ; AX = c/d + 3*a/2

; c-a+1
mov bx, c
sub bx, a
dec bx ; BX = c-a-1


cwd 
idiv bx ; AX = (c/d + 3*a/2) / (c-a+1)


mov result, ax