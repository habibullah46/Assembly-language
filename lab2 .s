.data
prompt_msg: .asciiz "Enter a number: "
space: .asciiz " "

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

# sort array in ascending order
la $t0, array # pointer to start of array
la $t1, n # pointer to end of array
li $t2, 1 # size of array element

la $t4, 1 # loop counter

sort_loop:
  # check if loop counter is greater than n - 1
  sub $t5, $t1, $t0
  addi $t5, $t5, 1
  blt $t4, $t5, sort_continue
  
  j done_sorting # done sorting

sort_continue:
  # load current and next array elements
  lw $t6, ($t0)
  add $t7, $t0, $t2
  lw $t8, ($t7)

  # compare elements and swap if necessary
  ble $t6, $t8, sort_no_swap
  sw $t8, ($t0)
  sw $t6, ($t7)

sort_no_swap:
  # increment loop counter and pointer to current array element
  addi $t4, $t4, 1
  addi $t0, $t0, 1

  j sort_loop

done_sorting:
  # print array in ascending order
  li $v0, 4
  la $a0, asc_msg
  syscall

  la $t0, array # pointer to start of array
  la $t1, n # pointer to end of array
  li $t2, 1 # size of array element

  li $t4, 1 # loop counter

print_loop:
  # check if loop counter is greater than n
  sub $t5, $t1, $t0
  addi $t5, $t5, 0
blt $t4, $t5, print_dsc_continue

j done_printing_dsc # done printing

print_dsc_continue:

#print current array element
lw $a0, ($t1)
li $v0, 1
syscall

#print space
li $v0, 4
la $a0, space
syscall

#decrement loop counter and pointer to current array element
addi $t4, $t4, 1
sub $t1, $t1, $t2

j print_dsc_loop

done_printing_dsc:

#print newline
li $v0, 4
la $s0, newline
syscall

#exit program
li $v0, 10
syscall
