.data # Data declaration section
	array_1: .word 1:3 # primer array 
	array_2: .word 1:3 #segundo array 
	vector1: .asciiz "Ingrese un numero del vector 1:\n "
	vector2: .asciiz "Ingrese un numero del vector 2:\n "
	escalar: .asciiz "El producto escalar es: "
    productoo: .asciiz "\n"
.text# Assembly language instructions
main: # Start of code section

	la $t0, array_1
	la $t1, array_2
# show text "ingrese numero"
  loop1: 
	beq $t2, 3 end_loop1
	li $v0, 4
 	la $a0, vector1  #imprime  numeros  del vector
 	syscall

 	li $v0, 5
 	syscall

 	move $a0, $v0
 	sw $a0, 0($t0) 

 	add $t0, $t0, 4
 	add $t2, $t2, 1
	j loop1 # regresa al inicio del ciclo

  end_loop1:

	li $t2, 0
        li $v0, 4
 	la $a0, productoo
 	syscall
        #inicio del segundo ciclo

	loop2:
		beq $t2, 3 end_loop2 

		li $v0, 4
 		la $a0, vector2 #imprime  numeros  del vector
 		syscall

 		li $v0, 5
 		syscall
 		move $a0, $v0
 		sw $a0, 0($t1) 
 		add $t1, $t1, 4
 		add $t2, $t2, 1# i++
 		j loop2 # regresa al inicio del ciclo

 	end_loop2:
 		li $t2, 0
 		la $t0, array_1
 		la $t1, array_2
 		li $t6, 0
                
                #iniciio del tercer ciclo 
 		loop3:
			beq $t2, 3 end_loop3
			lw $t3, 0($t0) #cargo  del primer  array
			lw $t4, 0($t1) #cargo  del segundo array
			mult $t3, $t4  # multiplicacion
			mflo $t5 

			add $t6, $t6, $t5 #sumamos los valores

			add $t0, $t0, 4
			add $t1, $t1, 4

			add $t2, $t2, 1 #contador
			j loop3 # regresa al inicio del ciclo

		end_loop3:
                        li $v0, 4
 	                la $a0, productoo
 	                syscall

			li $v0, 4
			la $a0, escalar
			syscall 

			li $v0, 1 #  suma 
			syscall

			jr $ra
