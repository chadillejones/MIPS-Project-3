#Chadille Jones
#02856918 % 11 = 9 Base 35

.data #section to declare data
user_input: .space 2000 # creating space for the user input
invalid: .asciiz "NaN" #creating the error message for incorrect input

.text #Assembly language instruction
.globl main

main 

	li $v0, 8 #accepts user input
	la $a0, user_input
	li $a1, 1002 #specify the length og the input a person can enter
	syscall
	
	lw $t0, user_input #loads the word in $t0
	sub $sp, $sp, 4 #moves the pointer for stack
	sw $t0, 4($sp) #adds the input string to the word
	
	
	jal processString #jumps to subprogram A
	
	
prcoessString:   #subprogram A to accept all the string and make it substrings
	
	sw $ra, 0($sp) #stores the return address for the program
	li $t1, 44 #loads a comma
	lw $t2, 4($sp) #loads the user_input
	
	la $t3, $t2 #loads the address of the input string 
	
	lw $ra, 0($sp) #loads the return address for processString
	jr $ra #return to where was called
	