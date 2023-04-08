.data
prompt: .asciiz"Enter an integer:"
output: .asciiz"\n you typed the number:"
.text 
main:
#prompt for the integer to enter
li $v0, 4
la $a0, prompt
syscall
#REAd the integer and save it in $s0
li $v0, 5
syscall
move $s0, $v0
#output the text
li $v0, 4 
la $a0, output
syscall
#output the number
li $v0 , 1
move $a0, $s0
syscall
 # exit the program 
li $v0, 10
syscall
