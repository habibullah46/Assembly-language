
.text
main:
  
  li $t0, 0     
  la $a0, B      
  li $a1, 5      
  jal sum_calc   
  sub $t1, $t0, $v0   
  move $a0, $t1   
  li $v0, 1      
  syscall        
  li $v0, 10     
  syscall


# a = sum, b = size, A = array
sum_calc:
  add $t2, $zero, $zero  
loop:
  bge $t2, $a1, endloop   
  sll $t3, $t2, 2         
  add $t3, $a0, $t3      
  lw $t4, ($t3)           
  add $t0, $t0, $t4       
  addi $t2, $t2, 1       
  j loop
endloop:
  move $v0, $t0          
  jr $ra   

  .data
B: .word 1, 2, 3, 4, 5
