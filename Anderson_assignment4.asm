;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Nicole Anderson
;;CSC 210
;;Assignment 4
;;3/25/2015
;;Prompts user to input a word and a number, then prints the word out that many times 
;;Then prompts the user to input three numbers, then prints in descending order
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	
	
	;;;;;;;;;;;;;;;;;;;Word;;;;;;;;;;;;;;;;;;
	push dword Newword			;Pushes the string Newword
	call printf						;Prints the phrase Newword to the screen
	add esp, 4						;Adds 4 to the stack pointer to clean it up
	
	push dword words				;Push the address of the words buffer
	push dword format2				;Push the address of the format string
	call scanf						;Scans in the word and puts the value into words
	add esp, 8						;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Number ;;;;;;;;;;;;;;;;;;
	push dword Number			;Pushes the string Number
	call printf					;Prints the phrase Number to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword firstnum				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the number and puts the value into firstnum
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;Loop;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov eax, firstnum				;moves firstnum to eax
	
	Looper:							;A label to jump to
	
	cmp eax, 0						;compares eax to 0
	je done							;Jump if eax is equal to 0
	
	push dword words				;Pushes the value of words
	push dword Loopword				;Pushes the phrase Loopword
	call printf						;Prints Loopword phrase with words in it
	add esp, 8						;Adds 8 to the stack pointer to clean it up
	
	dec eax							;Decrements eax
	jmp Looper						;jumps back to the label Looper
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;blankline;;;;;;;;;;;;;;
	push dword blank			;Pushes the string blank
	call printf					;Prints the phrase blankto the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;;Three Numbers;;;;;;;;;;;;;;;;;;
	push dword ThreeNum			;Pushes the string ThreeNum
	call printf					;Prints the phrase ThreeNum to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword num1				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into num2
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	push dword num2				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into num2
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	push dword num3				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into num2
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	push dword [num3]				;Pushes the value in num3
	push dword [num2]			;Pushes the value in num2
	push dword [num1]			;Pushes the value in num1
	push dword Echos			;Pushes the string Echos
	call printf					;Prints the phrase Echos with values of num1, num2, and num3
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;Descending Order;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov ebx, [num1]				;Moves value of num1 into ebx
	mov ecx, [num2]				;Moves value of num2 into ecx
	mov edx, [num3]				;Moves value of num3 into edx
	
	
	cmp ebx, ecx				;Compares ebx to ecx
	jge block1					;If ebx is greater than ecx, it jumps to block1
	jle block2					;If ecx is greater than ebx, it humps to block2
	
	;if (ebx>ecx)
	block1:
	cmp ecx, edx				;Compares ebx to ecx
	jge block3					;If ecx is greater than edx, it jumps to block3
	jle block4					;If edx is greater than ecx, it humps to block4
	
	;if(ecx>ebx)
	block2:
	cmp ebx, edx				;Compares ebx to edx
	jge block5					;If ebx is greater than edx, it jumps to block5
	jle block6					;If edx is greater than ebx, it humps to block6
	
	;if(ebx>ecx>edx)
	block3:
	push dword edx				;Pushes the value of edx
	push dword ecx				;Pushes the value of ecx
	push dword ebx				;Pushes the value of ebx
	push dword Desc				;Pushes the string Desc
	call printf					;Prints the string Desc with the value of ebx, ecx and edx
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	
	block4:
	cmp ebx, edx				;Compares ebx to edx
	jge next1					;Jumps to next1
	
	;if(ebx>edx>ecx)
	push dword ecx				;Pushes the value of edx
	push dword edx				;Pushes the value of ecx
	push dword ebx				;Pushes the value of ebx
	push dword Desc				;Pushes the string Desc
	call printf					;Prints the string Desc with the value of ebx, ecx and edx
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	;if(edx>ebx>ecx)
	next1:					
	push dword ecx				;Pushes the value of edx
	push dword ebx				;Pushes the value of ecx
	push dword edx				;Pushes the value of ebx
	push dword Desc				;Pushes the string Desc
	call printf					;Prints the string Desc with the value of ebx, ecx and edx
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	;if(ecx>ebx>edx)
	block5:
	push dword edx				;Pushes the value of edx
	push dword ebx				;Pushes the value of ecx
	push dword ecx				;Pushes the value of ebx
	push dword Desc				;Pushes the string Desc
	call printf					;Prints the string Desc with the value of ebx, ecx and edx
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	block6:
	cmp edx, ecx				;Compares edx to ecx
	jge next2					;if edx is greater it jumps next2
	
	;if(ecx>edx>ebx)
	push dword edx				;Pushes the value of edx
	push dword ecx				;Pushes the value of ecx
	push dword ebx				;Pushes the value of ebx
	push dword Desc				;Pushes the string Desc
	call printf					;Prints the string Desc with the value of ebx, ecx and edx
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	;if(edx>ecx>ebx)
	next2:
	push dword edx				;Pushes the value of edx
	push dword ecx				;Pushes the value of ecx
	push dword ebx				;Pushes the value of ebx
	push dword Desc				;Pushes the string Desc
	call printf					;Prints the string Desc with the value of ebx, ecx and edx
	add esp, 16					;Adds 16 to the stack pointer to clean it up
	
	
	
	
	
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
	format  db  	"%d\n", 10, 0																;Defines format
	format2	db	"%s\n", 10, 0															;Defines format2
	Newword	db	"Please enter a word: ", 10, 0										;Defines Newword phrase
	Number	db	"Please enter a number: ", 10, 0										;Defines Number phrase
	Loopword db "%s", 10, 0																;Defines Loopword phrase
	Echos	db 	"You entered: %d, %d, and %d.", 10, 0										;Defines Echos phrase
	Desc	db 	"Your numbers in descending order: %d, %d, and %d.", 10, 0										;Defines Desc phrase
	Number	db	"Please enter three more number: ", 10, 0										;Defines Number phrase
	blank db  " ",10,0				;Defines Blank phrase
	
	[SECTION .bss]					;Section containing uninitialized data
	num1		resd	1			;Reserves space for one number value from input in num1
	num2		resd	1			;Reserves space for one number value from input in num2
	num3		resd	1			;Reserves space for one number value from input in num3
	firstnum	resd	1			;Reserves space for one number value from input in firstnum
	words		resd	1			;Reserves space for one word value from input in word