.data
B: .word 4,8,5,6,5
size_array: .word 5
result: .word 0

.text
.globl main

main:
    la $t0, B
    lw $t1, size_array
    li $t2, 0

    addi $t3, $zero, 0
Loop:
    beq $t3, $t1, EndLoop
    lw $t4, 0($t0)
    add $t2, $t2, $t4
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    j Loop
EndLoop: 

    move $a0, $t2
    move $a1, $t1
    la $a2, B
    jal sum_calc
    sw $v0, result
display:
    li $v0, 1
    lw $a0, result
    syscall
Exit:
    li $v0, 10
    syscall

sum_calc:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    move $s0, $a0
    move $t0, $a2
    move $t1, $a1
    li $t2, 0

    addi $t3, $zero, 0
Loop2:
    beq $t3, $t1, EndLoop2
    lw $t4, 0($t0)
    add $t2, $t2, $t4
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    j Loop2
EndLoop2:

    move $v0, $s0

    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8
    jr $ra