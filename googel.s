.data
num1: .word 0
num2: .word 0
num3: .word 0
num4: .word 0
num5: .word 0
array: .word 5, 3, 8, 1, 9
n: .word 5
prompt_msg: .asciiz "Enter a number: "
space: .asciiz " "
.text
.globl main
main:
li $v0, 5
syscall
sw $v0, num1($zero)

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num2($zero)

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num3($zero)

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num4($zero)

li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num5($zero)

lw $t0, num1($zero)
lw $t1, num2($zero)
lw $t2, num3($zero)
lw $t3, num4($zero)
lw $t4, num5($zero)

li $t5, 0
la $t6, array
la $t7, n

print_loop:
    bge $t5, $t7,
