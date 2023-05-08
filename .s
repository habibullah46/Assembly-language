.data
newline: .asciiz "enter a two number to add \n"   # define a null-terminated string containing only a newline character

.text
.globl main
main:
li $v0, 5      # system call for reading an integer
syscall        # read integer from user
move $t0, $v0  # move this input into temporary register

li $v0, 5      # system call for reading an integer
syscall        # read integer from user
move $t1, $v0  # move this input into temporary register

add $t2, $t1, $t0  # compute the sum
move $a0, $t2      # move result into the accumulator
li $v0, 1          # system call for printing an integer
syscall            # print the integer

li $v0, 4          # system call for printing a string
la $a0, newline    # load address of newline string
syscall            # print the newline character

Exit:
li $v0, 10  # exit code
syscall       # exit the program
