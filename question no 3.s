.data
.text
.globl main
main:
li  $t1, 4
li   $t2, 3
li   $t3, 2
li $t4,1
mul $t1 , $t1,$t2
mul $t5, $t1,$t3
mul $t6,$t5,$t4
display:
move $a0,$t6;
li $v0,1
syscall
exit:
li $v0,10
syscall