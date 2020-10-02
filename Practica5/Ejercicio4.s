.data # Data declaration section
    ingrese_num:.asciiz  "Ingrese un numero:\n"
	numero: .asciiz "\n EL numero:\n "
	multiplo: .asciiz "\n si es  multiplo de:\n"
	no_multiplo: .asciiz "\n no es multiplo de:\n"
	
.text # Assembly language instructions

main: 
	li $v0, 4 
 	la $a0, ingrese_num #muestra texto
 	syscall

 	li $v0, 5
 	syscall
 	move $t0, $v0 
 	li $t1, 1 
	
	Loop:             
		beq $t1, 21 Exit		
		div $t1, $t0
		mfhi $a0
		beq $a0, 0, LABEL_IF
		 LABEL_ELSE:
		 
		 	li $v0, 4 
		 	la $a0, numero #muestra texto
		 	syscall
		 	
		 	li $v0, 1
		 	move $a0, $t1
		 	syscall
		 	
		 	li $v0, 4 
		 	la $a0,no_multiplo #muestra  no_multiplo
		 	syscall

		 	li $v0, 1
		 	move $a0, $t0
		 	syscall
		 	b END_LABEL_IF
			
		  LABEL_IF:
		  	li $v0, 4 
		 	la $a0, numero#muestra texto
		 	syscall
		 	
		 	li $v0, 1
		 	move $a0, $t1
		 	syscall
		 	
		 	li $v0, 4 
		 	la $a0, multiplo  #  multiplo
		 	syscall

		 	li $v0, 1
		 	move $a0, $t0
		 	syscall
			
		  END_LABEL_IF:
		  	add $t1, $t1, 1 # iterador
		j Loop 
	Exit:		
jr $ra
