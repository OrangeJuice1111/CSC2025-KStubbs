.386p

.model flat

extrn _ExitProcess@4:near
extrn _GetStdHandle@4:near
extrn _WriteConsoleA@20:near

.data
msg			DB 61h
newline		DB 0ah
outhandle	DD ?
written		DD ?
space		DB	20h



.code
main PROC near 


;STD_OUTPUT_HANDLE
	push  -11               
	call _getStdHandle@4
	mov  outhandle, eax

	mov al, 61h

	mov msg, al
	mov	esi, 0
_char_loop_start:
	cmp		msg, 7bh
	jge		_char_loop_end
	cmp		esi, 3
	jle		_print_letter

	;WriteConsole(handle, &newline[0], 13, &written, 0)
	push   0
	push   offset written
	push   1
	push   offset newline
	push   outhandle
	call   _WriteConsoleA@20
	mov		esi, 0
	

_print_letter:

	;WriteConsole(handle, &msg[0], 13, &written, 0)
	push   0
	push   offset written
	push   1
	push   offset msg
	push   outhandle
	call   _WriteConsoleA@20


	;WriteConsole(handle, &msg[0], 13, &written, 0)
	push   0
	push   offset written
	push   1
	push   offset space
	push   outhandle
	call   _WriteConsoleA@20

	inc msg
	inc esi


	jmp	_char_loop_start

_char_loop_end:

	push 0
	call _ExitProcess@4

main ENDP

END