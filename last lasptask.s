.data
B: .word 300, 200, 100, 0   # initialize array B

.text
main:
    li $t0, 3               
    lw $t1, B               
    lw $t2, 0($t1)          
    lw $t3, 4($t1)          
    lw $t4, 8($t1)         
    add $t5, $t2, $t3      
    add $t5, $t5, $t4       
    sll $t0, $t0, 2         
    add $t0, $t1, $t0       
    sw $t5, ($t0)           

    # Exit program
    li $v0, 10              
    syscall