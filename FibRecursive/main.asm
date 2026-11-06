.386p
.model flat
 
extrn _ExitProcess@4:near
extrn fibrecurse:near           
 
.data
n   DWORD 10                   
 
.code
main PROC near
 
    mov  eax, n                 
    push eax                   
    call fibrecurse             
    add  esp, 4                
                               
 
    push 0
    call _ExitProcess@4
 
main ENDP
 
END main
 