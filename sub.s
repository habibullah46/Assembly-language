.data
.text
.globl main
main:
 li $t1, 10
  li $t2, 5
sub $t0,$t1,$t2
display:
move $a0,$t0
li $v0,1
syscall
exit:
li $v0 , 10
syscall
