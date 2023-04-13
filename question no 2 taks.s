 .data 
.text
.globl main
main:
.data
B:      .word   1, 2, 3, 4, 5 
size_array: .word   5      
sum:    .word   0             
result: .word   0 
main:
    
    la $t0, B          
    lw $t1, size_array  
    lw $t2, sum         
    li $t3, 0           
    
loop:
   
    bge $t3, $t1, end_loop
   
    lw $t4, ($t0)       
    add $t2, $t2, $t4   
    addi $t3, $t3, 1    
    addi $t0, $t0, 4   
    
    j loop              
    
end_loop:
   
    jal sum_calc        
    sub $t2, $t2, $v0  
    sw $t2, result      
    
   display:
    lw $a0, result      
    li $v0, 1           
    syscall             
    
 exit:
    li $v0, 10          
    syscall