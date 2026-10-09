.386p

.model flat

extrn	_ExitProcess@4:near
extrn	_GetStdHandle
extrn	_WriteConsoleA@20

.data

msg			DB 'Hello','World', 0 ;0ah is the new line commmand
outhandle	DD ?
written		DD ?


.code
main PROC near 

	push	-11
	call	_GetStdHandle
	mov		outhandle, eax

	; int i = 0
	mov	ecx, 0


_loop_start:
	mov		eax, offset msg
	add		eax, eax
	mov		ebx, [eax]
	cmp		[eax], 0
	je		_loop_end


	;WriteConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	1
	push	eax
	push	outhandle
	call	_WriteConsoleA@20

	;WriteConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	1
	push	offset msg
	push	outhandle
	call	_WriteConsoleA@20

	inc		ecx
	jmp		_loop_start

_loop_end
	


	push 0
	call _ExitProcess@4

main ENDP

END