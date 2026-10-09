.386
.model flat, stdcall
option casemap:none

extrn ExitProcess:proc
extrn GetStdHandle:proc
extrn WriteConsoleA:proc

.data
    num1 db 11
    num2 db 22
    buffer db 3 dup(0)        ; buffer for ASCII digits (2 digits + null)
    outhandle dd ?
    written dd ?

.code

main PROC

   ;STD_OUTPUT_HANDLE
	push  -11               
	call _getStdHandle@4
	mov  outhandle, eax


    mov outhandle, eax

    ; Add num1 and num2
    mov al, [num1]
    add al, [num2]

    ; Convert sum to ASCII decimal
    mov bl, 10
    xor ah, ah
    div bl                    ; AL = tens digit, AH = units digit

    add al, '0'
    mov [buffer], al

    add ah, '0'
    mov [buffer+1], ah

    ; WriteConsoleA(outhandle, buffer, 2, &written, 0)
     push 0
	push offset written
	push 2
	push offset buffer
	push outhandle
	call _WriteConsoleA@20



    push   0
	call   _ExitProcess@4

    main ENDP

    END 
