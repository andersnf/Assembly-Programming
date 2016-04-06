;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Author:	Nicole Anderson
;;Course:	CSC 210 section 001
;;Program: 	Anderson_assignment2.asm
;;Due:		2/20/2015
;;Description: Prints my name to the screen. It then prints my current age and
;;             computes what age I will be in 42 years. Finally it prints how 
;;			   old I am in dog years.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[SECTION .text]					;section containing code

extern printf					;Tells the compiler to reference the C function library for printf
global main						;Required so liker can find entry point

main:							;Entry point of Program
	push ebp					;Sets up the stack frame
	mov ebp, esp
	push ebx
	push esi
	push edi
								;End of top portion of boilerplate code
								
	push dword Named			;Pushes the phrase Named
	call printf					;Prints the string Named to the screen
	add esp, 4					;Adds 4 to the stack pointer to clean it up
	
	mov eax, 23					;Moves the value 23 into register eax
	mov ecx, 42					;Moves the value 42 into register ecx
	
	add ecx, eax				;Adds the two registers ecx and eax
	
	push dword ecx				;Pushes the value of ecx
	push dword eax				;Pushes the value eax
	push dword s1				;Pushes the string s1
	call printf					;Prints the string s1 with the values of eax and ecx
	add esp, 12					;Adds 12 to the stack pointer to clean it up
	
	mov eax, 23					;Moves the value 23 to eax
	mov ecx, 7					;Moves the value 7 to ecx
	imul ecx, eax				;Multiplies ecx and eax together, and stores it into ecx
	
	push dword ecx				;Pushes the value of ecx
	push dword s2				;Pushes the string s2
	call printf					;Prings the string s2 with the value of ecx
	add esp, 8					;Adds 8 to the stack pointer to clean it up
	
								;Bottom part of boilerplate code
	pop edi						;Program restores saved register values by
	pop esi						;popping them from the stack as they
	pop ebx						;were pushed from the beginning.
	mov esp, ebp				;Destroys stack frame before returning
	pop ebp
	ret							;Returns the control to LINUX
	
[SECTION .data]					;Section containing initialized data

	Named	db	"Nicole Anderson",10,0													;Defines Named phrase
	s1 		db	"I am %d years old now and in 42 years I will be %d years old.",10,0	;Defines s1 phrase 
	s2		db	"In dog years, I am %d years old.", 10, 0								;Defines s2 phrase
	
		
[SECTION .bss]					;Section containing uninitialized data

	