.386p

.model flat

extrn _ExitProcess@4:near


.data



.code
main PROC near 
  mov  eax, 6            
 
    mov  ebx, 1            
    mov  edx, 1             
    mov  esi, 1             
 
    
    cmp  eax, 2
    jbe  Finished
 
   
    mov  ecx, eax           
    sub  ecx, 2             
 
FibLoop:
    mov  esi, edx           
    add  esi, ebx           
    mov  ebx, edx          
    mov  edx, esi           
    loop FibLoop            
 
Finished:
    mov  eax, esi           
 



	push 0
	call _ExitProcess@4

main ENDP

END