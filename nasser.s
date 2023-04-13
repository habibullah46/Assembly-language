data
Array: .word 1,2,3,4,5
sizeArray: .word 5
Result: .word 0

.text
.globl main

main:
    la $t0, Array
    lw $t1, sizeArray
    li $t2, 0

    addi $t3, $zero, 0
First_Loop: #start first looop
    beq $t3, $t1, EndLoop
    lw $t4, 0($t0)
    add $t2, $t2, $t4
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    j First_Loop
EndFirst_Loop: 

    move $a0, $t2
    move $a1, $t1
    la $a2, Array
    jal sum_calc
    sw $v0, Result
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
Second_Loop:  # start second loop
    beq $t3, $t1, EndLoop2
    lw $t4, 0($t0)
    add $t2, $t2, $t4
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    j Second_Loop
EndSecond_Loop:

    move $v0, $s0

    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8
    jr $ra