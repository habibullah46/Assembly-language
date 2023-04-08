.data
.text
.globl main
main:
 li $s1 , 3
li $s2 , 4
add $t0, $s1, $s2
display: 
move $a0, $t0
li $v0, 1
syscall
sxit:
li $v0,10
syscall