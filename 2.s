.data
Array: .word 1, 2, 3, 4, 5
size: .word 5
FinalResult: .word 0

.text
.globl main

main:
    la $t0, Array
    lw $t1, size
    li $t2, 0

    addi $t3, $zero, 0
FirstLoop:
    beq $t3, $t1, EndFirstLoop
    lw $t4, 0($t0)
    add $t2, $t2, $t4
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    j FirstLoop
EndFirstLoop: 

    move $a0, $t2
    move $a1, $t1
    la $a2, Array
    jal Final_calculation
    sw $v0, FinalResult
display:
    li $v0, 1
    lw $a0, FinalResult
    syscall
Exit:
    li $v0, 10
    syscall

Final_calculation:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    move $s0, $a0
    move $t0, $a2
    move $t1, $a1
    li $t2, 0

    addi $t3, $zero, 0
Second_Loop:
    beq $t3, $t1, EndSecond_Loop
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