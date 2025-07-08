.data
	mensaje:  .ascii "Ingresa un numero: "
.text
.globl main
main:
 	la $a0, mensaje
 	li $v0, 4
 	syscall    

 	li $v0, 5
 	syscall    
 	move $a0, $v0  
 	jal fibonacci

 	move  $a0, $v0  
 	li $v0, 1
 	syscall

 	li $v0, 10   
 	syscall

fibonacci: 
 	li $t0, 1  
 	beqz $a0, caso0 
	beq $a0, $t0, caso1  
 	j recursion

caso0:
 	li $v0, 0  
 	jr $ra

caso1:
 	li $v0, 1  
 	jr $ra

recursion:
 	addi $sp, $sp, -16  
      	sw $a0, 4($sp)  
 	sw $ra, 0($sp)  

 	addi $a0, $a0, -1  
 	jal fibonacci   
 	sw $v0, 8($sp)  

 	lw $a0, 4($sp)  
 	addi $a0, $a0, -2  
 	jal fibonacci   
 	sw $v0, 12($sp)  

 	lw $ra, 0($sp)  
 	lw $t0, 8($sp)  
 	lw $t1, 12($sp)  
 	addi $sp, $sp, 16  
 	add $v0, $t0, $t1 

 	jr $ra
