;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Nicole Anderson
;;CSC 210
;;Assignment 5
;;a)Convert 24 hour clock time into a 12 hour clock time
;;b)solves factorials
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
	
	;;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;							
	push dword blank			;Pushes the phrase blank
	call printf					;Prints the string blank to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Time Converter;;;;;;;;;;;;;;;;;;;;;;							
	push dword Time				;Pushes the phrase Time
	call printf					;Prints the string Time to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword hour			;Pushes the string hour
	call printf					;Prints the phrase hour to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword num1				;Push the address of the integer buffer
	push dword format			;Push the address of the format number
	call scanf					;Scans in the number and puts the value into num1
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	push dword minutes			;Pushes the string minutes
	call printf					;Prints the phrase minutes to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	push dword num2				;Push the address of the integer buffer
	push dword format			;Push the address of the format number
	call scanf					;Scans in the number and puts the value into num2
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
	mov eax, num1				;Moves the value of num1 into eax
	mov ebx, num2				;Moves the value of num1 into ebx
	
	mov ecx, 0					;Moves the value of 0 into ecx
	cmp eax, ecx				;Compares eax and ecx
	je midnight					;If eax is equal to 0 then it jumps to noon
	
	mov ecx, 11					;Moves the value 11 into ecx
	cmp eax, ecx				;Compares ebx to ecx
	jle block1					;If eax is less than or equal to ecx, it jumps to block1
	
	mov ecx, 24					;Moves the value of 24 into ecx
	cmp eax, ecx				;Compares eax and ecx
	je midnight					;If eax is equal to 24 it jumps to midnight
	
	sub eax, 12					;Subtracts 12 from eax
	
	push dword ebx						;Pushes the value of ebx
	push dword eax						;Pushes the value of eax
	push dword ConverterPM				;Pushes the string ConverterAM
	call printf							;Prints the string ConverterAM with the value of ebx, ecx and edx
	add esp, 12							;Adds 12 to the stack pointer to clean it up
	
	
	midnight:
	mov eax, 12					;Moves the value of 12 into eax
	
	block1:
	
	push dword ebx						;Pushes the value of ebx
	push dword eax						;Pushes the value of eax
	push dword ConverterAM				;Pushes the string ConverterAM
	call printf							;Prints the string ConverterAM with the value of ebx, ecx and edx
	add esp, 12							;Adds 12 to the stack pointer to clean it up
	;;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;							
	push dword blank			;Pushes the phrase blank
	call printf					;Prints the string blank to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Factorial;;;;;;;;;;;;;;;;;;;;;;							
	push dword Factorial		;Pushes the phrase Factorial
	call printf					;Prints the string Factorial to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	
	
	;;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;							
	push dword blank			;Pushes the phrase blank
	call printf					;Prints the string blank to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	;;;;;;;;;;;;;;;;;;;Array;;;;;;;;;;;;;;;;;;;;;;							
	push dword Array			;Pushes the phrase Array
	call printf					;Prints the string Array to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	
	;;;;;;;;;;;;;;;;;;;blank;;;;;;;;;;;;;;;;;;;;;;							
	push dword blank			;Pushes the phrase blank
	call printf					;Prints the string blank to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
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

	Named		db	"Nicole Anderson",10,0								;Defines Named phrase	
	Time		db	"24-Hour Time Converter Subprogram:",10,0			;Defines Time phrase
	hour		db	"Please enter the hours: ",10,0						;Defines hour phrase
	minutes		db	"Please enter the minutes: ",10,0					;Defines minutes phrase
	ConvertedAM	db	"The time for 12-Hour Clock is %d:%d AM",10,0		;Defines ConvertedAM phrase
	ConvertedPM	db	"The time for 12-Hour Clock is %d:%d PM",10,0		;Defines ConvertedPM phrase
	Factorial 	db	"Factorial Subprogram",10,0							;Defines Factorial phrase
	Array		db	"Array Subprogram",10,0								;Defines Array phrase
	format  db  	"%d\n", 10, 0										;Defines format
	blank 		db  " ",10,0											;Defines Blank phrase
	
[SECTION .bss]					;Section containing uninitialized data
	num1		resd	1			;Reserves space for one number value from input in num1
	num2		resd	1			;Reserves space for one number value from input in num2
	num3		resd	1			;Reserves space for one number value from input in num3
	array		resd	6			;Reserves space for 6 number value from input in array