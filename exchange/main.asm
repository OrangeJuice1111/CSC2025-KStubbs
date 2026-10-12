.386p
.model flat

extrn _ExitProcess@4:near
extrn _GetStdHandle@4:near
extrn _WriteConsoleA@20:near

.data
numberStr1	DB		'10', 0
numberStr2	DB		'20', 0
numberStr3	DB		'30', 0
numberStr4	DB		'40', 0
outhandle	DD		?
written		DD		?
newline		DB 0ah



.code
main PROC near 

	;STD_OUTPUT_HANDLE
		push  -11               
		call _getStdHandle@4
		mov  outhandle, eax

		push	0
		push	offset	written
		push	2
		push	offset	numberStr1
		push	outhandle
		call   _WriteConsoleA@20

		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		push	0
		push	offset	written
		push	2
		push	offset	numberStr2
		push	outhandle
		call   _WriteConsoleA@20

		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		push	0
		push	offset	written
		push	2
		push	offset	numberStr3
		push	outhandle
		call   _WriteConsoleA@20
		
		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		push	0
		push	offset	written
		push	2
		push	offset	numberStr4
		push	outhandle
		call   _WriteConsoleA@20

		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		mov al,			numberStr4
		mov bl,			numberStr1
		mov numberStr4,	bl
		mov numberStr1,	al

		mov al,			numberStr3
		mov bl,			numberStr2
		mov	numberStr3,	bl
		mov numberStr2,	al


		push	0
		push	offset	written
		push	2
		push	offset	numberStr1
		push	outhandle
		call   _WriteConsoleA@20

		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		push	0
		push	offset	written
		push	2
		push	offset	numberStr2
		push	outhandle
		call   _WriteConsoleA@20

		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		push	0
		push	offset	written
		push	2
		push	offset	numberStr3
		push	outhandle
		call   _WriteConsoleA@20
		
		push   0
		push   offset written
		push   1
		push   offset newline
		push   outhandle
		call   _WriteConsoleA@20

		push	0
		push	offset	written
		push	2
		push	offset	numberStr4
		push	outhandle
		call   _WriteConsoleA@20


	push 0
	call _ExitProcess@4

main ENDP

END