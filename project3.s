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
	