.data
prompt_msg: .asciiz "Enter a number: "
space: .asciiz " "
newline: .asciiz "\n"

num1: .word 0
num2: .word 0
num3: .word 0
num4: .word 0
num5: .word 0

array: .word 0:5
n: .word 5

asc_msg: .asciiz "\nAscending order: "
dsc_msg: .asciiz "\nDescending order: "

.text
.globl main

main:
# prompt user for input 1
li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num1

# prompt user for input 2
li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num2

# prompt user for input 3
li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num3

# prompt user for input 4
li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num4

# prompt user for input 5
li $v0, 4
la $a0, prompt_msg
syscall

li $v0, 5
syscall
sw $v0, num5

# sort array in descending order
la $t0, array # pointer to start of array
la $t1, n # pointer to end of array
li $t2, 1 # size of array element

la $t4, 1 # loop counter

sort_loop:
  # check if loop counter is greater than n - 1
  sub $t5, $t1, $t0
  addi $t5, $t5, 1
  blt $t4, $t5, sort_continue
  
  j done_sorting_dsc # done sorting

sort_continue:
  # load current and next array elements
  lw $t6, ($t0)
  add $t7, $t0, $t2
  lw $t8, ($t7)

  # compare elements and swap if necessary
  bge $t6, $t8, sort_no_swap_dsc
  sw $t8, ($t0)
  sw $t6, ($t7)

sort_no_swap_dsc:
  # increment loop counter and pointer to current array element
  addi $t4, $t4, 1
  addi $t0, $t0, 1

  j sort_loop

done_sorting_dsc:
  # print array in descending order
  li $v0, 4
  la $a0, dsc_msg
  syscall

  la $t0, array # pointer to start of array
  la $t1, n # pointer to end of array
