.data
list: .word 3, 2, 1, 0, 1, 2

.text

li $t0, 0x00000000  #initialize a loop counter to $t0
li $t4, 0x00000005  #last index of array
li $t3, 0x00000000  #this will hold our final sum
la $t1, list  #the address of list[0] is in $t1

.globl _start
_start:
    loop: addi $t0, $t0, 0x00000001 #index++
    add $t5, $t0, $t0 #array index X2
    add $t5, $t0, $t0 #array index X2 again
    add $t6, $t5, $t1 #4x array index in $t6

    lw $t2, 0($t6)   #load list[index] into $t2
    add $t3, $t3, $t2 #$t3 = $t3 + $t2
    beq $t0, $t4, end
    j loop

end: