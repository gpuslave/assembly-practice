ORG 100h
.MODEL SMALL

.DATA
    arr DB 5 DUP(?)
    size DW 5

    c DB 100
    d DB 125
    count DB 0
    msg DB 'Count var is: ', '$' 

    temp DB 0
    temp_sign DB 0

.CODE
    ; input
    mov CX, size
    mov SI, 0
    
    input_loop:
        mov AH, 01h
        int 21h
        
        cmp AL, '-'
        je set_sign
        
        cmp AL, '0'
        jb end_input
        cmp AL, '9'
        ja end_input
        
        sub AL, '0'
        mov BL, AL
        
        mov AL, temp
        xor AH, AH
        mov BH, 10
        mul BH
        add AL, BL
        
        mov temp, AL
        jmp input_loop
        
    set_sign:
        mov DL, 1
        mov temp_sign, DL
        jmp input_loop
        
    end_input:
        mov AH, temp
        cmp temp_sign, 1
        jne not_negative
        neg AH
        mov DL, 0
        mov temp_sign, DL
    
    not_negative:
        mov arr[SI], AH
        inc SI
        mov DL, 0
        mov temp, 0
        loop input_loop
                
                
    ; counting c <= arr[i] <= d, arr[i] >= 0
    mov CX, size
    mov SI, 0
    
    next_element:
        mov AL, arr[SI]
        cmp AL, 0
        jl not_in_range
        cmp AL, c
        jl not_in_range
        cmp AL, d
        jg not_in_range
    
    inc count
    
    not_in_range:
        inc SI
        loop next_element
        
    ; output    
    mov AH, 02h 
    mov DL, 0Dh 
    int 21h

    mov DL, 0Ah 
    int 21h
     
    mov AH, 09h
    lea DX, msg
    int 21h
    
    mov AH, 02h
    mov DL, count
    add DL, '0'
    int 21h
    
    ret