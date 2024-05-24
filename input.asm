ORG 100h
.MODEL SMALL

.DATA
num DW 0 ; Define a word to store the number
sign DB 0 ; Define a byte to store the sign

.CODE
mov cx, 0 ; Initialize CX to 0. CX will hold the number.
mov [sign], 1 ; Initialize the sign to 1

input_loop:
    mov ah, 01h ; AH=01h selects the "read character" function
    int 21h ; Call DOS. AL will contain the character read from keyboard

    cmp al, '-' ; Check for minus sign
    je set_sign ; If AL = '-', set the sign

    cmp al, '0' ; Compare AL with '0'
    jb end_input ; If AL < '0', end the input
    cmp al, '9' ; Compare AL with '9'
    ja end_input ; If AL > '9', end the input

    sub al, '0' ; Convert from ASCII to number
    xor ah, ah ; Clear AH
    mov ax, cx ; Move CX to AX
    mov cx, 10 ; Load 10 into CX
    imul cx ; Multiply AX by CX. The result is in DX:AX.
    mov cx, ax ; Move the result back to CX
    add cx, ax ; Add AX to CX
    jmp input_loop ; Repeat

set_sign:
    mov [sign], -1 ; Set the sign to -1
    jmp input_loop ; Repeat

end_input:
mov ax, cx ; Move CX to AX
mov bx, [sign] ; Load the value at [sign] into BX
imul bx ; Multiply AX by BX. The result is in DX:AX.
mov cx, ax ; Move the result back to CX
mov [num], cx ; Store the number