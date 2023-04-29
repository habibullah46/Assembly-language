.data 
prompt_msg: .asciiz "Enter a number: "
space: .asciiz " "
.text
.globl main

main:
li $v0, 5
syscall
sw $v0, num1 

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num2

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num3

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num4

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num5

lw $t0, num1
lw $t0, num2
lw $t0, num3
lw $t0, num4
lw $t0, num5

li $t0, 0
la $t1, array
la $t2, n

li $t3, 1
add $t5, $t2, $zero
sub $t5, $t5, $t0

lw $t4, ($t1)
add $t6, $t1, $t3
lw $t7, ($t6)
bge $t7, $t4, skip_swap

sw $t7, ($t1)
sw $t4, ($t6)

lw $a0, ($t1)
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall

addi $t0, $t0, 1
addi $t1, $t1, 4

j print_loop

li $t3, 1
add $t5, $t2, $zero
sub $t5, $t5, $t0

lw $t4, ($t1)
add $t6, $t1, $t3
lw $t7, ($t6)
ble $t7, $t4, skip_reverse_swap

sw $t7, ($t1)
sw $t4, ($t6)

lw $a0, ($t1)
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall

addi $t0, $t0, 1
addi $t1, $t1, 4

j reverse_print_loop

li $v0, 10
syscall
