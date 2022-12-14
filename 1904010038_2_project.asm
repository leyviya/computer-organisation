.data

str1: .asciiz "I'm Leyla Abdullayeva." # Store initial string
str2: .space 128            # Allocate memory space for the new string

.text

main:
la $s0, str1            # Load address of first character
la $s1, str2            # Load the address of second string

loop:
    lbu  $t2, 0($s0)        # Load the first byte of $s0 (str1) into $t2

sb   $t2, 0($s1)        # Save the value in $t2 at the same byte in $s1 (str2)

addi $s0, $s0, 1        # Increment both memory locations by 1 byte
addi $s1, $s1, 1
bne  $t2, $zero, loop   

j done
done:
li $v0, 4
la $a0, str2
syscall                 

li $v0, 10              # Program end syscall
syscall