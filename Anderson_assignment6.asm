;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Nicole Anderson
;;CSC 210
;;Assignment 6
;;4/22/2015
;;Structures and floating points
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	
[SECTION .bss]					;Section containing uninitialized data
	gpa1			resd	1	;Reserves space for a floating number
	gpa2			resd	1	;Reserves space for a floating number
	number1			resd	1	;Reserves space for a number
	sumed			resd	1	;Reserves space for a floating number
	subtract		resd	1	;Reserves space for a floating number
	squared			resd	1	;Reserves space for a floating number

	
	struc student				;Declares the structure prototype
		x 	resd	1
		y 	resd	1
	endstruc	
	
[SECTION .data]					;Section containing initialized data

	Named		db		"Nicole Anderson",10,0								;Defines Named phrase
	term		db		"****Successful Program Termination****", 10, 0		;Defines term phrase
	format  	db  	"%d\n",10, 0										;Defines format
	format2  	db  	"%f\n", 0									;Defines format2
	blank 		db  	" ",10,0											;Defines Blank phrase
	prompt1		db		"The following information should be entered in order of total completed hours, current hours and GPA with spaces between them", 10, 0		;Defines the prompt1 phrase
	OneInfo		db		"Please enter StudentOne's Information: ", 10, 0	;Defines OneInfo phrase
	TwoInfo		db		"Please enter StudentTwo's Information: ", 10, 0	;Defines OneInfo phrase
	StudentOne	db		"StudentOne: total: %d	current: %d	GPA: %f", 10, 0 ;Defines StudentOne phrase
	StudentTwo	db		"StudentTwo: total: %d	current: %d	GPA: %f", 10, 0 ;Defines StudentTwo phrase
	Update		db		"Updating StudentTwo: ", 10, 0						;Defines Update phrase
	prompt2		db		"Commputing Sum and Difference in GPAs of the two students: ", 10, 0 ;Defines prompt2 phrase
	sum			db		"The sum of the student GPAs is %f", 10, 0			;Defines sum phrase
	difference	db		"The difference of the student GPAs is %f", 10, 0 	;Defines difference phrase
	squareRoot	db		"The squareRoot of the difference is %f", 10, 0	;Defines squareRoot phrase
	
	studentOne:			;Names the structure structOne
		istruc student	;Declares the type of struct
		at x,	dd	0	;Initializes the structure variables
		at y,	dd	0
		iend

	studentTwo:			;Names the structure structOne
		istruc student	;Declares the type of struct
		at x,	dd	0	;Initializes the structure variables
		at y,	dd	0
		iend
		
[SECTION .text]	
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
	
	
	;;;;;;;;;;;;;;;;;;;Prompt;;;;;;;;;;;;;;;;;;;;;;							
	push dword prompt1			;Pushes the phrase prompt1
	call printf					;Prints the string prompt1 to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;;;StudentOnes Info;;;;;;;;;;;;;;;;;;;;;;							
	push dword OneInfo			;Pushes the phrase OneInfo
	call printf					;Prints the string OneInfo to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword number1				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into number1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	mov eax, [number1]			;Moves the value of number1 into the eax register
	mov dword [studentOne+x], eax	;Moves the value of eax into studentOne at x
	
	push dword number1				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into number1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	mov eax, [number1]			;Moves the value of number1 into the eax register
	mov dword [studentOne+y], eax	;Moves the value of eax into studentOne at y
	
	push dword gpa1				;Push the address of the integer buffer
	push dword format2			;Push the address of the format2 string
	call scanf					;Scans in the Second number and puts the value into number1
	add esp, 8					;Adds 8 to the stack pointer to clean it up

	;;;;;;;;;;;;;;;;;;;StudentTwos Info;;;;;;;;;;;;;;;;;;;;;;							
	push dword TwoInfo			;Pushes the phrase TwoInfo
	call printf					;Prints the string TwoInfo to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword number1				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into number1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	mov eax, [number1]			;Moves the value of number1 into the eax register
	mov dword [studentTwo+x], eax	;Moves the value of eax into studentOne at x
	
	push dword number1				;Push the address of the integer buffer
	push dword format			;Push the address of the format string
	call scanf					;Scans in the Second number and puts the value into number1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	mov eax, [number1]			;Moves the value of number1 into the eax register
	mov dword [studentTwo+y], eax	;Moves the value of eax into studentOne at y

	push dword gpa2				;Push the address of the integer buffer
	push dword format2			;Push the address of the format2 string
	call scanf					;Scans in the Second number and puts the value into number1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;;;;
	push dword blank			;Pushes the phrase blank
	call printf					;Prints a blank line
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;Echo Student One;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov eax, [studentOne +x]		;Moves value x of studentOne into the eax register
	mov ebx, [studentOne +y]		;Moves value y of studentOne into the eax register
	
	fld dword [gpa1]				;loads floating point number from memory onto the top of the stack
	sub esp, 8						;Makes space on the stack for floating point
	fstp qword [esp]				;Stores floating point and then pops from the stack
	
	push dword ebx					;Pushes the value in the ebx register
	push dword eax					;Pushes the value in the eax register
	push dword StudentOne			;Pushes the string StudentOne
	call printf						;Prints the phrase StudentOne with values of eax, ebx, and gpa1
	add esp,20						;Adds 16 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;Echo Student Two;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov eax, [studentTwo +x]		;Moves value x of studentTwo into the eax register
	mov ebx, [studentTwo +y]		;Moves value y of studentTwo into the eax register
	
	fld dword [gpa2]				;loads floating point number from memory onto the top of the stack
	sub esp, 8						;Makes space on the stack for floating point
	fstp qword [esp]				;Stores floating point and then pops from the stack
	
	push dword ebx					;Pushes the value in the ebx register
	push dword eax					;Pushes the value in the eax register
	push dword StudentTwo			;Pushes the string StudentOne
	call printf						;Prints the phrase studentOne with the values of eax, ebx, and gpa2
	add esp, 20						;Adds 16 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;;;;
	push dword blank			;Pushes the phrase blank
	call printf					;Prints a blank line
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;;Update StudentTwo;;;;;;;;;;;;;;;;;;;;;;							
	push dword Update			;Pushes the phrase Update
	call printf					;Prints the string Update to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	mov eax, [studentTwo +x]		;Moves value x of studentTwo into the eax register
	mov ebx, [studentTwo +y]		;Moves value y of studentTwo into the eax register
	
	add eax, ebx					;Adds the values of eax and ebx
	
	mov [studentTwo + x], eax		;Moves the value of eax into studentTwo x
	mov ebx, 0						;Moves 0 into ebx
	mov [studentTwo + y], ebx		;Moves 0 into studentTwo y
	
	fld dword [gpa2]				;loads floating point number from memory onto the top of the stack
	sub esp, 8						;Makes space on the stack for floating point
	fstp qword [esp]				;Stores floating point and then pops from the stack
	
	
	push dword ebx					;Pushes the value in the ebx register
	push dword eax					;Pushes the value in the eax register
	push dword StudentTwo			;Pushes the string StudentOne
	call printf						;Prints the phrase studentOne with the values of eax, ebx, and gpa2
	add esp, 20						;Adds 16 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;;;;
	push dword blank			;Pushes the phrase blank
	call printf					;Prints a blank line
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;;;Prompt2;;;;;;;;;;;;;;;;;;;;;;							
	push dword prompt2			;Pushes the phrase prompt2
	call printf					;Prints the string prompt2 to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Sum;;;;;;;;;;;;;;;;;;;;;;
	fld dword [gpa1]				;loads floating point number from memory onto the top of the stack
	fadd dword [gpa2]				;adds gpa2 to the value in position ST0
	sub esp, 8						;Makes space on the stack for floating point
	fstp qword [esp]				;Stores floating point and then pops from the stack
	
	
	push dword sum				;Pushes the phrase sum
	call printf					;Prints the string sum to the screen
	add esp, 12					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Difference;;;;;;;;;;;;;;;;;;;;;;	
	fld dword [gpa1]				;loads floating point number from memory onto the top of the stack
	fsub dword [gpa2]				;Subtracts gpa2 from the value in  position ST0
	sub esp, 8						;Makes space on the stack for floating point
	fstp qword [esp]				;Stores floating point and then pops from the stack
	
	push dword difference		;Pushes the phrase difference
	call printf					;Prints the string difference to the screen
	add esp, 12					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Square Root;;;;;;;;;;;;;;;;;;;;;;
	fld dword [gpa1]				;loads floating point number from memory onto the top of the stack
	fsub dword [gpa2]				;subtracts gpa2 from the value in position ST0
	fabs							;Takes the absolute value of ST0
	fsqrt							;Takes the squareroot of ST0
	sub esp, 8						;Makes space on the stack for floating point
	fstp qword [esp]				;Stores floating point and then pops from the stack
	
	push dword squareRoot		;Pushes the phrase squareroot
	call printf					;Prints the string squareroot to the screen
	add esp, 12					;Adds 4 to the stack pointer to clean it up
	
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
	

		