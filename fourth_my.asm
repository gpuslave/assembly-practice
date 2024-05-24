ORG 100h
.MODEL SMALL

.DATA
arr DB -10, 20, 30, 40, -50
c DB -15 
d DB 35 
array_size DW 5 
count DB 0 

.CODE
mov cx, array_size 
mov si, 0 

next_element:
mov al, arr[si] 
cmp al, 0 
jl not_in_range 
cmp al, c 
jl not_in_range 
cmp al, d 
jg not_in_range 


inc count 

not_in_range:
inc si
loop next_element

ret