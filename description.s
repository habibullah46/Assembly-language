.data
.text
.globl main
main:
li $t1,5
li $t3,1 
move $t2,$t1 
factorial: 
addi $t1,$t1,-1 

mul $t2,$t2,$t1
bne $t1,$t3,factorial
display: 
move $a0,$t2
li $v0,1 
syscall
Exit:
li $v0,10
syscall 