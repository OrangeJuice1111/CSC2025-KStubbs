.386p
.model flat

extrn _ExitProcess@4:near
extrn _GetStdHandle@4:near
extrn _WriteConsoleA@20:near



.data
fibonacci	DB	?
prev		DB	1
current		Db	1
next		DB	1
outhandle	DD  ?
written		DD		?

.code
main PROC near 

;STD_OUTPUT_HANDLE
	push  -11               
	call _getStdHandle@4
	mov  outhandle, eax

	cmp		eax,1
	jmp		_fib_loop_end

	cmp		eax,2
	jmp		_case_change

	mov ebx,	1
	mov edx,	1

_case_change:
	mov eax, 1


_fib_loop_start:
	mov	eax,ebx
	add eax,edx

	mov	ebx,edx
	mov edx, eax

	dec ecx
	jnz _fib_loop_start

_fib_loop_end:

	push 0
	call _ExitProcess@4

main ENDP

END