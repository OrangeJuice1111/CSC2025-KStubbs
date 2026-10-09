.386p
.model flat

extrn _ExitProcess@4:near
extrn _GetStdHandle@4:near
extrn _WriteConsoleA@20:near

.data
msg       DB 'Hello World!', 10  ; 10 is the new line command
msg1	  DB 'And Goodbye!', 0
outhandle DD  ?
written   DD  ?


.code

main PROC near 

	mov ebx, offset msg

	;STD_OUTPUT_HANDLE
	push  -11               
	call _getStdHandle@4
	mov  outhandle, eax

	;WriteConsole(handle, &msg[0], 13, &written, 0)
	push   0
	push   offset written
	push   13
	push   offset msg
	push   outhandle
	call   _WriteConsoleA@20

	;WriteConsole(handle, &msg[0], 13, &written, 0)
	push 0
	push offset written
	push 13
	push offset msg1
	push outhandle
	call _WriteConsoleA@20



	push   0
	call   _ExitProcess@4

main ENDP

END