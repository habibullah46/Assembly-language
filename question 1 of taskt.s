.data 
.text
.globl main
main:
li $t0,300
li $t1,200
li $t2,100
li $t3,0

li $s0,3
add $t4,$t0,$t1
add $t4,$t4,$t2
sw $t4,12($sp)

display:
move $a0,$t4
li $v0, 1      
syscall   

exit:
li $v0,10
syscall