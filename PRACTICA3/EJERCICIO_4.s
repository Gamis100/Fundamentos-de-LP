.data 	
    out_string1: .asciiz "\nIngrese un numero:\n"
	out_string2: .asciiz "\n EL numero:\n "
	out_string3: .asciiz "\n Si es  multiplo de:\n"
	out_string4: .asciiz "\n No es multiplo de:\n"
	
.text 
main: 
	li $v0, 4 #mostrar texto por consola
 	la $a0, out_string1
 	syscall

 	li $v0, 5
 	syscall
 	move $t0, $v0 # se almacena el registro
 	li $t1, 1 
	
	Loop:                #  es  el nombre  de  la etiqueta 
		beq $t1, 21 Exit #  condicional 		
		div $t1, $t0
		mfhi $a0
		beq $a0, 0, LABEL_IF
		 LABEL_ELSE:
		 
		 	li $v0, 4 #mostrar texto por consola
		 	la $a0, out_string2
		 	syscall
		 	
		 	li $v0, 1
		 	move $a0, $t1
		 	syscall
		 	
		 	li $v0, 4 #mostrar texto por consola
		 	la $a0, out_string4 #  no es  multiplo
		 	syscall

		 	li $v0, 1
		 	move $a0, $t0
		 	syscall
		 	b END_LABEL_IF
			
		  LABEL_IF:
		  	li $v0, 4 #mostrar texto por consola
		 	la $a0, out_string2
		 	syscall
		 	
		 	li $v0, 1
		 	move $a0, $t1
		 	syscall
		 	
		 	li $v0, 4 #mostrar texto por consola
		 	la $a0, out_string3  #  si es  multiplo
		 	syscall

		 	li $v0, 1
		 	move $a0, $t0
		 	syscall
			
		  END_LABEL_IF:
		  	add $t1, $t1, 1 # i++	t1=es  mi iterador
		j Loop #salto de linea 
	Exit:	#  controlo  el fin de mi ciclo		
jr $ra