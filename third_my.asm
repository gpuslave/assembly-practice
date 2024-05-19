ORG 100h
.MODEL SMALL

.DATA
a DW 10 ; initialize with your value
b DW 20 ; initialize with your value
X DW 0 ; initialize with your value

.CODE
; Compare a and b
cmp a, b

; Jump to appropriate label based on comparison
jl a_less_than_b
je a_equals_b
jg a_greater_than_b

a_less_than_b:
; Calculate X = b/a - 1
mov ax, b
cwd ; Convert word to doubleword
idiv a ; AX = b/a, DX = remainder
dec ax ; AX = b/a - 1
mov X, ax
jmp end

a_equals_b:
; Set X = -295
mov X, -295
jmp end

a_greater_than_b:
; Calculate X = (a-235)/b
mov ax, a
sub ax, 235 ; AX = a - 235
cwd ; Convert word to doubleword
idiv b ; AX = (a - 235)/b
mov X, ax

end: