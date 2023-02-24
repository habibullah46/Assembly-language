.data
.text
.globl main
main:
li.s $f1, 3.0
li.s $f2, 4.0
display:
mov.s $f0,$f2;
li $v0,1
syscall
exit:
li $v0,10
syscall