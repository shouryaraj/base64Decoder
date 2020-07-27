#
#  base64decode.s (incomplete)
#
#  by Deborah Pickett 2003-02-27
#
#  This MIPS program reads lines of Base 64-encoded text from standard
#  input, and outputs the decoded bytes to standard output.
#

# INSERT YOUR CODE AT THE POINT INDICATED BELOW.

#
# Data segment
#
        .data
        # Space to read a line into.
inbuffer: .space 80
        # The Base 64 alphabet, in order.
sequence: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

nextLine: .asciiz "\n"

#
# Text segment
#
        .text
        # Program entry.
main:
        # The first byte we're expecting is byte 0 of a group of 4.
        la $t9, byte0

        # Read a string from standard input.
loop:   li $v0, 8
        la $a0, inbuffer
        li $a1, 80
        syscall

        # Is this an empty line?  Since SPIM can't detect when end of
        # file has been reached, we need to use another way to indicate
        # the end of the Base 64 data.  We'll use a completely
        # blank line for this.
        lb $t0, inbuffer
        # First character newline means there was no text on this line,
        # so end the program.
        beq $t0, 10, alldone

        # Walk along the string.  Start at the beginning.
        la $t8, inbuffer

        # Go back to where we left off last time (byte 0, 1, 2 or 3).
        jr $t9


        # Get four characters at a time.
byte0:  lbu $s0, 0($t8)
        add $t8, $t8, 1
        beq $s0, 10, linedone
        
        # Now up to byte 1.
        la $t9, byte1
byte1:  lbu $s1, 0($t8)
        add $t8, $t8, 1
        beq $s1, 10, linedone

        # Now up to byte 2.
        la $t9, byte2
byte2:  lbu $s2, 0($t8)
        add $t8, $t8, 1
        beq $s2, 10, linedone

        # Now up to byte 3.
        la $t9, byte3
byte3:  lbu $s3, 0($t8)
        add $t8, $t8, 1
        beq $s3, 10, linedone

        # Now all bytes in this block are read.
        # Four Base64 characters are now in $s0, $s1, $s2, $s3.
bytesdone:
        #
        # DO NOT DELETE THIS LINE.

        ######
        #
        # PUT YOUR ANSWER HERE.
        # Your answer should not modify $t8 or $t9, as they are used by
        # the above code.
        #
        ######
        # checking the bottom padding
	la $t0, ($s3)
	li $t2, 61
	li $s4, 0
	beq $t0, $t2, storeOne 	
	j continue
	
storeOne:
	li $s4, 1
	li $t2, 61
	la $t0, ($s2)
	beq $t0, $t2, storeTwo
	j continue
storeTwo:
	li $s4, 2
	
	
continue:	
        la $t0, sequence
        # loading the starting address of sequence
        # $t2 is the counter for the loop  and starts with the one because it is do while loop()
        # It will gives us 
        addi $t2, $0, 0
loopDecodeFors0:
        
       # condition to check if we found the char in the sequence
        lb $t1, 0($t0) 
        la $t3, ($s0)
        beq $t1, $t3, exitDecodeFors0
       # increment the counter for the sequence
        addi $t2, $t2 1
      # increment the address of the sequence to fetch the next sequence
        addi $t0, $t0, 1
      # Increment the address 
      # \n  we have to use the system
    	j loopDecodeFors0

exitDecodeFors0:

       
        # storing thr sequence value in the $s0 for the first character
	move $s0, $t2
	
	# Reloading the address of the sequence
	la $t0, sequence
	# Reinitaizing the counter for the next char
	addi $t2, $0, 0
	
	
	
loopDecodeFors1:
        
       # condition to check if we found the char in the sequence
        lb $t1, 0($t0) 
        la $t3, ($s1)
        beq $t1, $t3, exitDecodeFors1
       # increment the counter for the sequence
        addi $t2, $t2 1
      # increment the address of the sequence to fetch the next sequence
        addi $t0, $t0, 1
      # Increment the address 
      # \n  we have to use the system
    	j loopDecodeFors1

exitDecodeFors1:
       # srlv $
        # storing thr sequence value in the $s0 for the first character
	move $s1, $t2
	
	# Reloading the address of the sequence
	la $t0, sequence
	
	# Reinitaizing the counter
	addi $t2, $0, 0
	
	li $t4, 2
	beq $s4, $t4, decodeone
	

loopDecodeFors2:
        
       # condition to check if we found the char in the sequence
        lb $t1, 0($t0) 
        la $t3, ($s2)
        beq $t1, $t3, exitDecodeFors2
       # increment the counter for the sequence
        addi $t2, $t2 1
      # increment the address of the sequence to fetch the next sequence
        addi $t0, $t0, 1
      # Increment the address 
      # \n  we have to use the system
    	j loopDecodeFors2

exitDecodeFors2:
       # srlv $
        # storing thr sequence value in the $s0 for the first character
	move $s2, $t2
	
	# Reloading the address of the sequence
	la $t0, sequence
	
	# Reinitaizing the counter
	addi $t2, $0, 0
	
	li $t4, 1
	beq $s4, $t4, decodeone


loopDecodeFors3:
        
       # condition to check if we found the char in the sequence
        lb $t1, 0($t0) 
        la $t3, ($s3)
        beq $t1, $t3, exitDecodeFors3
       # increment the counter for the sequence
        addi $t2, $t2 1
      # increment the address of the sequence to fetch the next sequence
        addi $t0, $t0, 1
      # Increment the address 
      # \n  we have to use the system
    	j loopDecodeFors3

exitDecodeFors3:
       # srlv $
        
        # storing thr sequence value in the $s0 for the first character
	move $s3, $t2
	
	# Reloading the address of the sequence
	la $t0, sequence
	
	# Reinitaizing the counter
	addi $t2, $0, 0
	

# LEft shift for the decoded values to fetch the addtitional two bit from another char decoded value

	
decodeone:	
	
        
	# Masking with the $S0 
	# shifting the binary values by two spaces to combine it from the top most bit of the next char
	sll $s0, $s0, 2
	
	# Masking process shifting by for two position 000000011
	li $t0, 3
	# shifted by the 00000110000 or could be done in the first place by 48 value
	sll $t0, $t0, 4
	
	# add operation for example $s1 = 00111111 && 00110000 ==> 1100000 got the value of the top two bits
	and $t0, $t0, $s1
	# now shift rigth at least two bits 110000 ==> 000011
	srl $t0, $t0, 4
	
	# Final step to combine the bits 10101100  || 00000011 ==> 10101111
	or $s0, $t0, $s0
	
	li $t4, 2
	beq $s4, $t4, printOne
	
decodetwo:
	# Masking for the $s1
	# loading 15 for 00001111 for masking
	li $t0, 15
	# s1=00110101 && 00001111 ==> 00000101 got the least four bits
	and $t0, $t0, $s1
	
	# shift second character least 4 bits to the top 
	
	sll $t0, $t0, 4
	
	# Getting the top 4 bits from the third charachter
	li $t1, 15
	# shift  by 2 the bits to fetch the top 4 bits
	sll $t1, $t1, 2
	
	# getting the top bits
	and $t1, $t1, $s2
	# shifting to right to make the top bits to least four bits
	srl $t1, $t1, 2
	
	# combine s1 bit and s2 bit
	
	or $t0, $t1, $t0
	
	move $s1, $t0
	
	li $t4, 1
	beq $s4, $t4, printTwo
decodethree:	
	# read the least two bits from the char stored in the s2 that is third char
	li $t0, 3
	# getting least two bit using the masking with and logic 00111111 && 00000011 ==> 00000011
	and $t0, $s2, $t0
	
	# adding this leat to bits to the top of the $s3 bits
	# shift 6 places to fit at most of 8 bits
	
	sll $t0, $t0, 6
	# adding needs or login 
	or $t0, $s3, $t0
	move $s2, $t0
	
	
	
	
	la $a0, 0($s0)        # prompt
        addi $v0, $0, 11 
        syscall
        la $a0, 0($s1)        # prompt
        addi $v0, $0, 11 
        syscall
        la $a0, 0($s2)        # prompt
        addi $v0, $0, 11 
        syscall
        
        j endgroup
	
	
printOne:
	la $a0, 0($s0)        # prompt
        addi $v0, $0, 11 
        syscall
        j endgroup

printTwo:
        la $a0, 0($s0)        # prompt
        addi $v0, $0, 11 
        syscall	
        la $a0, 0($s1)        # prompt
        addi $v0, $0, 11 
        syscall
	
        # DO NOT DELETE THIS LINE.
        #
endgroup:
        # Go back to do next bunch of four bytes.  We're now expecting
        # byte 0 of 4.
        la $t9, byte0
        j byte0

linedone:
        # Line is finished; go get another one.
        j loop

alldone:
        # Exit.
        li $v0, 10
        syscall

