.386p

.model flat

extrn _ExitProcess@4:near
extrn _GetStdHandle@4:near
extrn _WriteConsoleA@20:near


.data
num1	DB	5
num2	DB	3
outhandle	DD ?
written		DD ?



.code
main PROC near 

;STD_OUTPUT_HANDLE
	push  -11               
	call _getStdHandle@4
	mov  outhandle, eax




	;add
		mov al, num1
		add al, num2
		mov	sum, al

		push	0
		offset	sum
		push	2
		offset	sum
		push	outhandle
		call	_add: near

	push 0
	call _ExitProcess@4

main ENDP

END