.386p

.model flat

exturn _ExitProcess@4:near
exturn	_add: near
.data

.code

main PROC near 

	push 0
	call _ExitProcess@4

main ENDP

END