ORG 100h
.MODEL SMALL

.DATA
arr DW -10, 20, -30, 40, -50
c DW -15 
d DW 35 
array_size DW 5 
count DW 0 

.CODE
mov cx, array_size 
mov si, 0 

next_element:
mov ax, arr[si] 
cmp ax, 0 
jl not_in_range 
cmp ax, c 
jl not_in_range 
cmp ax, d 
jg not_in_range 


inc count 

not_in_range:
inc si
inc si
loop next_element 