.text
main:
#prompt for the string to enter 
li $v0, 4
la $a0, prompt 
syscall
#Read the string
li $v0,5
la $a0, input
lw $a1,inputSize
syscall
#Output the text 
li $v0, 4
la $a0,output
syscall
#output the number
li $v0, 4
la $a0, input
syscall
#Exit the program
li $v0, 10
syscall
.data
input: .space 81
inputSize: .word 80
prompt: .asciiz " enter an string"
output: .asciiz "\n you type the string"