.386p
.model flat

extrn _ExitProcess@4:near
extrn _GetStdHandle@4:near
extrn _WriteConsoleA@20:near

STD_OUTPUT_HANDLE equ -11

.data
message      BYTE "Hello from PrintLine in assembly!", 0Dh, 0Ah, 0
bytesWritten DWORD ?

.code

PrintLine PROC near
    push ebp
    mov  ebp, esp
    push ebx
    push esi

    mov  esi, [ebp+8]           ; esi = address of the string

    mov  ecx, 0                 ; ecx = length counter
CountLoop:
    cmp  BYTE PTR [esi+ecx], 0  ; reached the 0 at the end?
    je   DoneCounting
    inc  ecx
    jmp  CountLoop
DoneCounting:
    mov  ebx, ecx              

    push STD_OUTPUT_HANDLE
    call _GetStdHandle@4        

    push 0
    push OFFSET bytesWritten
    push ebx
    push esi
    push eax
    call _WriteConsoleA@20

    mov  eax, bytesWritten      

    pop  esi
    pop  ebx
    pop  ebp
    ret
PrintLine ENDP

main PROC near
    push OFFSET message
    call PrintLine
    add  esp, 4                 

    push 0
    call _ExitProcess@4
main ENDP

END main