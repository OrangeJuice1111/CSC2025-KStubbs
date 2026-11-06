.386p
.model flat

extrn _ExitProcess@4:near

.data
n   DWORD   7          

.code
main PROC near

    mov  eax, n        
    mov  edi, eax       

    mov  ebx, 1         
    mov  edx, 1        
    mov  esi, 1         
    mov  ecx, 3         

fib_loop:
    cmp  ecx, edi       
    ja   fib_done       

    mov  esi, edx       
    add  esi, ebx
    mov  ebx, edx      
    mov  edx, esi       

    inc  ecx            
    jmp  fib_loop

fib_done:
    mov  eax, esi       

    push 0
    call _ExitProcess@4

main ENDP

END