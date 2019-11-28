#Chadille Jones
#02856918 % 11 = 9 Base 35

.data #section to declare data
user_input: .space 2000 # creating space for the user input
invalid: .asciiz "NaN" #creating the error message for incorrect input
subString: .word 0, 0, 0, 0 #initialize a word list

.text #Assembly language instruction
.globl main

main: 

	li $v0, 8 #accepts user input
	la $a0, user_input
	li $a1, 1002 #specify the length of the input a person can enter
	syscall
	
	lw $t0, user_input #loads the word in $t0
	sub $sp, $sp, 4 #moves the pointer for stack
	sw $t0, 4($sp) #adds the input string to the word
	
	
	jal processString #jumps to subprogram A
	
	
processString:   #subprogram A to accept all the string and make it substrings
	
	sw $ra, 0($sp) #stores the return address for the program
	li $t1, 44 #loads a comma
	lw $t2, 4($sp) #loads the user_input
	la $t3, ($t2) #loads the address of the input string 
	li $t4, 0x0A #loads a newline
	li $t6, 0 #length of substring
	li $t7, 0 #check if leading 
	li $t8, 32 #loads a space
	li $t9, 9 #loads a tab
	
	loop: #loop to parse each substring
		
		lb $t5, 0($t3)	#loads one byte of the word
		beq $t5, $t4, lastSubstring #branches if the byte is equal to a newline
		beq $t5, $t1, parseSubstring #branches if the byte is equal to a commma
		addi $t6, $t6, 1 #increments the length of substring
		addi $t3, $t3, 1 #increments the address of the word
		j loop
	
	parseSubstring: #takes care of parsing the substring
		sub $t3, $t3, $t6 #returns the word address to the first byte
		
	loopTwo: 
		lb $t5, 0($t3) #loads one byte of the word
		beq $t7, $zero, leading_chars #branch if byte could be leading
		
		
		
	leading_chars: #checks if it is a leading space/tab
		beq $t5, $t8, skip_leading_tab_or_space
		beq $t5, $t9, skip_leading_tab_or_space
		addi $t7, $t7, 1 #increments the amount of non-space or non-tab chars
		j loopTwo
		
	skip_leading_tab_or_space: #increments char
		addi $t3, $t3, 1
		j loopTwo
	
	
	lastSubstring: #checks the final substring		
		lw $ra, 0($sp) #loads the return address for processString
		jr $ra #return to where was called
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	