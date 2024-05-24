ORG 100h
.MODEL SMALL

.DATA
a DW -1 
b DW -2 
X DW 0 

.CODE

mov ax, a
mov bx, b
cmp ax, bx 


jl a_less_than_b
je a_equals_b
jg a_greater_than_b

a_less_than_b:
; X = b/a - 1
mov ax, b
cwd 
idiv a ; AX = b/a
dec ax ; AX = b/a - 1
mov X, ax
jmp end

a_equals_b:
; X = -295
mov X, -295
jmp end

a_greater_than_b:
; X = (a-235)/b
mov ax, a
sub ax, 235 ; AX = a - 235
cwd 
idiv b ; AX = (a - 235)/b
mov X, ax

end: