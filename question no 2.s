 .data
.text
.globl main
main:
li $t1, 7
li $t2, 10
sub $t0,$t1,$t2
addi $t0, $t0,2
addi $t0, $t0, 5
display:
move $a0,$t0;
li $v0,1
syscall
exit:
li $v0,10
syscall