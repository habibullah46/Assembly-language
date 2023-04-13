
#Task 1
.text
main:
# load B[0]+B[1]into $t0


lw $t1, (B)
add $t0, $t0, $t1


#Add B[2] to $t0
lw $t1, 8(B)
add $t0, $t1

#load i into $t1 then calculate B[i] address
lw $t1, i
sll $t1,$t1,2
la $t2,B
add $t2, $t2,$t1

#store result in B[i]
sw $t0,0($t2)

#exit program
li $v0, 10
syscall





.data
B: .word 300,200,100,0
i: .word 3 