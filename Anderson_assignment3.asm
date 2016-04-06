;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Author:	Nicole Anderson
;;Course:	CSC 210 section 001
;;Program: 	Anderson_assignment3.asm
;;Due:		2/20/2015
;;Description: Prints name to the screen then takes in a color and two numbers.
;;             It then echos these entries. Do +-*/ with the two numbers, print 
;;			   this to the screen. Then make a made up a username with the color
;;				and the two numers.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[SECTION .text]					;section containing code

extern printf					;Tells the compiler to reference the C function library for printf
extern scanf					;Tells the compiler to reference the C function library for scanf
extern getchar
global main						;Required so liker can find entry point

main:							;Entry point of Program
	push ebp					;Sets up the stack frame
	mov ebp, esp
	push ebx
	push esi
	push edi
								;End of top portion of boilerplate code
	
	;;;;;;;;;;;;;;;;;;;Name;;;;;;;;;;;;;;;;;;;;;;							
	push dword Named			;Pushes the phrase Named
	call printf					;Prints the string Named to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Number 1;;;;;;;;;;;;;;;;;;
	push dword Number			;Pushes the string Number
	call printf					;Prints the phrase Number to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword num1				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the first number and puts the value into num1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;;;;Number 2;;;;;;;;;;;;;;;;;;
	push dword Number2			;Pushes the string Number2
	call printf					;Prints the phrase Number2 to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword num2				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into num2
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;;Color;;;;;;;;;;;;;;;;;;;;;;;
	push dword Color			;Pushes the string Color
	call printf					;Prints the phrase Color to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword colors			;Push the address of the string buffer
	push dword format2			;Push the address of the format2 string
	call scanf					;Scans in the color and puts the value into colors
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	

	;;;;;;;;;;;;;;;;;;;;;Echo;;;;;;;;;;;;;;;;;;;;;;;;;;	
	push dword colors				;Pushes the value in colors
	push dword [num2]			;Pushes the value in num2
	push dword [num1]			;Pushes the value in num1
	push dword Echos			;Pushes the string Echos
	call printf					;Prints the phrase Echos with values of num1, num2, and colors
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;;;Addition;;;;;;;;;;;;;;;;;;;;;;
	mov eax, [num1]				;moves the value num1 into eax
	mov ebx, [num2]				;moves the value num2 into ebx
	mov ecx, eax				;Moves the value of eax into ecx
	mov edx, ebx				;Moves the value of ebx into edx
	
	add ecx, edx				;Adds ecx and edx, stores result to eax
	
	push dword ecx				;Pushes the value of ebx
	push dword ebx				;Pushes the value of eax
	push dword eax				;Pushes the value of ecx
	push dword sum				;Pushes the string sum
	call printf					;Prints the string sum with the value of eax, ebx and ecx
	add esp, 16					;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;;;Subtraction;;;;;;;;;;;;;;;;;;;;;
	mov eax, [num1]				;moves the value num1 into eax
	mov ebx, [num2]				;moves the value num2 into ebx
	mov ecx, eax				;Moves the value of eax into ecx
	mov edx, ebx				;Moves the value of ebx into edx
	
	sub ecx, edx				;Subtracts edx from ecx and then stores it into ecx
	
	push dword ecx				;Pushes the value of ecx
	push dword ebx				;Pushes the value of ebx
	push dword eax				;Pushes the value of eax
	push dword subt				;Pushes the string subt
	call printf					;Prints the string sum with the value of eax, ebx and ecx
	add esp, 16					;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;;Multiplication;;;;;;;;;;;;;;;;;;;;
	mov eax, [num1]				;moves the value num1 into eax
	mov ebx, [num2]				;moves the value num2 into ebx
	mov ecx, eax				;Moves the value of eax into ecx
	mov edx, ebx				;Moves the value of ebx into edx
	
	imul ecx, edx				;Multiplies ebx and ecx and then stores it into ecx
	
	push dword ecx				;Pushes the value of ecx
	push dword ebx				;Pushes the value of ebx
	push dword eax				;Pushes the value of eax
	push dword mult				;Pushes the string mult
	call printf					;Prints the string sum with the value of eax, ebx and ecx
	add esp, 16					;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;;;;;;Division;;;;;;;;;;;;;;;;;;;;;;;;;
	mov eax, [num1]				;moves the value num1 into eax
	mov ebx, [num2]				;moves the value num2 into ebx
	mov ecx, ebx				;Moves ebx into ecx
	
	cdq							;Initializes edx, by sign extension
	idiv ecx					;Divides the two numbers
	
	mov ecx, [num1]				;Moves the value of num1 into ecx
	
	push dword edx
	push dword eax				;Pushes the value of eax
	push dword ebx				;Pushes the value of ebx
	push dword ecx				;Pushes the value of ecx
	push dword divi				;Pushes the phrase divi
	call printf				;Prints the phrase divi with the valyes of ecx, ebx and eax
	add esp, 20				;Adds 16 to the stack pointer to clean it up
		
	;;;;;;;;;;;;;;;;;;;;;;;;;Username;;;;;;;;;;;;;;;;;;;;;;;;;
	mov eax, [num1]				;moves the value num1 into eax
	mov ebx, [num2]				;moves the value num2 into ebx
	

	push dword eax				;Pushes the value of eax
	push dword ebx				;Pushes the value of ebx
	push dword colors				;pushes the value of ecx
	push dword user				;Pushes the phrase user
	call printf					;Prints the phrase user with the values of ecx, ebx, and ecx
	add esp, 16
	
	;;;;;;;;;;;;;;;;;;Successful Termination;;;;;;;;;;;;;;;;;;;;
	push dword term				;Pushes the string term
	call printf					;Prints the string term
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
								;Bottom part of boilerplate code
	pop edi						;Program restores saved register values by
	pop esi						;popping them from the stack as they
	pop ebx						;were pushed from the beginning.
	mov esp, ebp				;Destroys stack frame before returning
	pop ebp
	ret							;Returns the control to LINUX
	
[SECTION .data]					;Section containing initialized data

	Named	db	"Nicole Anderson",10,0													;Defines Named phrase
	term	db	"****Successful Program Termination****", 10, 0							;Defines term phrase
	Number	db	"Please enter a number: ", 10, 0										;Defines Number phrase
	Number2	db	"Please enter another number: ", 10, 0									;Defines Number2 phrase
	Color	db	"Please enter your favorite color: ", 10, 0								;Defines Color phrase
	format  db  	"%d\n", 10, 0																;Defines format
	format2	db	"%s\n", 10, 0															;Defines format2
	Echos	db 	"You entered: %d, %d, and %s.", 10, 0										;Defines Echos phrase
	sum		db 	"		The sum of %d and %d is %d.", 10, 0								;Defines sum phrase
	subt	db 	"		The difference between %d and %d is %d.", 10 ,0 					;Defines subt phrase
	mult	db 	"		The product of %d and %d is %d.", 10, 0							;Defines mult phrase
	divi	db 	"		The quotient of %d and %d is %d", 10,"			with a remainder of %d.",10, 0
						;Defines divi phrase
	user 	db	"Your made up Username is %s_%d%d.", 10, 0								;Defines user phrase
	
	
		
[SECTION .bss]					;Section containing uninitialized data

	num1	resd	1			;Reserves space for one number value from input in num1
	num2	resd	1			;Reserves space for one number value from input in num2
	colors	resd	1			;Reserves space for one word value from input in color

	
