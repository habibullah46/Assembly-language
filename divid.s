.data
.text
.globl main
main:
 li $t1, 50
  li $t2, 20
div $t0,$t1,$t2
display:
move $a0,$t0
li $v0,1
syscall
exit:
li $v0 , 10
syscall