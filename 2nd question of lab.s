.data
B:          .word   1, 2, 3, 4, 5
size_array: .word   5
sum:        .word   0
result:     .word   0

.text
.globl main
main:
    la $t0, B            # load base address of array B into $t0
    lw $t1, size_array   # load size of array into $t1
    lw $t2, sum          # load initial value of sum into $t2
    li $t3, 0            # initialize counter to 0

loop:
    bge $t3, $t1, end_loop   # if counter >= size of array, exit loop

    lw $t4, ($t0)       # load current element of array into $t4
    add $t2, $t2, $t4   # add current element to sum
    addi $t3, $t3, 1    # increment counter
    addi $t0, $t0, 4    # increment array pointer to point to next element
    j loop              # jump to beginning of loop

end_loop:
    jal sum_calc        # call sum_calc subroutine to compute the sum of 1 to 5
    sub $t2, $t2, $v0   # subtract sum of 1 to 5 from sum of array elements
    sw $t2, result      # store result in memory

display:
    lw $a0, result      # load result into $a0 for printing
    li $v0, 1           # set system call for printing integer
    syscall             # print result
    j exit              # jump to exit

sum_calc:
    li $v0, 0           # initialize sum to 0
    li $t0, 1           # initialize counter to 1
sum_loop:
    bgt $t0, 5, sum_end # if counter > 5, exit loop
    add $v0, $v0, $t0   # add current value of counter to sum
    addi $t0, $t0, 1    # increment counter
    j sum_loop          # jump to beginning of loop
sum_end:
    jr $ra              # return to caller

exit:
    li $v0, 10          # set system call for exit
    syscall             # exit the program
