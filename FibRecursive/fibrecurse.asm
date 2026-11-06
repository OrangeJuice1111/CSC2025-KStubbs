.386p
.model flat
 
PUBLIC fibrecurse              
 
.code
fibrecurse PROC near
 
    push ebp
    mov  ebp, esp
    push ebx                   
 
    mov  eax, [ebp+8]           
 
    cmp  eax, 2
    jbe  BaseCase               
 
   
    dec  eax                    
    push eax
    call fibrecurse
    add  esp, 4
    mov  ebx, eax               
 
   
    mov  eax, [ebp+8]           
    sub  eax, 2                 
    push eax
    call fibrecurse
    add  esp, 4                
 
    add  eax, ebx               
    jmp  Done
 
BaseCase:
    mov  eax, 1                
 
Done:
    pop  ebx                   
    pop  ebp
    ret
 
fibrecurse ENDP
 
END
 