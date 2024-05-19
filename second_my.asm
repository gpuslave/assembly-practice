ORG 100h
.MODEL SMALL

.DATA
c DW 6 ; initialize with your value
d DW 3 ; initialize with your value
a DW 10 ; initialize with your value
result DW 0

.CODE
; Calculate c/d
mov ax, c
cwd ; Convert word to doubleword
idiv d ; AX = c/d, DX = remainder
mov bx, ax ; BX = c/d

; Calculate 3*a/2
mov ax, a
mov cx, 3
imul cx; AX = 3*a

cwd ; Convert word to doubleword
mov cx, 2
idiv cx ; AX = 3*a/2

; Add the two results
add ax, bx ; AX = c/d + 3*a/2

; Calculate c-a+1
mov bx, c
sub bx, a
dec bx ; BX = c-a-1

; Divide the two results
cwd ; Convert word to doubleword
idiv bx ; AX = (c/d + 3*a/2) / (c-a+1)

; Store the result
mov result, ax