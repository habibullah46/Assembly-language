.data
.text
.globl main
main:
li $t1, 10

addiu $t0, $t1,20
display:
move $a0, $t0
li $v0, 1
syscall
exit:
 li $v0 , 10
syscall