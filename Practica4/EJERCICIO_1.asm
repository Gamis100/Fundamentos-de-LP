 .data  # Data declaration section
    out_string1: .asciiz "\nIngrese un numero:\n"
	out_string2: .asciiz "\n Los 5 primeros multiplos de 4 son:"
	out_string3: .asciiz " "
	out_string4: .asciiz "\n"
	array_1:	.word	1:5
.text # Assembly language instructions
main: # Start of code section
	li $v0, 4
 	la $a0, out_string1 #  numero
 	syscall

	li $v0, 5
 	syscall
 	move $t0, $v0

	la $t1, array_1
	li $t2, 1 #contador
    loop1:
	beq $t5, $t0 end_loop1
	mult $t2, $t0 #hallamos los multiplos de 4
	mflo $a0 

	sw $a0, 0($t1) 
	add $t1, $t1, 4
	add $t2, $t2, 1
	add $t5, $t5, 1
	j loop1 # regresa al inicio del ciclo

    end_loop1:
	li $v0, 4
 	la $a0, out_string2   #mostrar texto
 	syscall
 	li $v0, 1
 	move $a0, $t0
 	syscall
 	li $v0, 4
	la $a0, out_string3   #mostrar texto
 	syscall

	la $t1, array_1
	li $t5, 0
        
    
    loop2:
        beq $t5, $t0 end_loop2
	lw $t3, 0($t1)
	add $t1, $t1, 4

        li $v0, 4
		la $a0,out_string4   #mostrar texto
  	syscall

	li $v0, 1 #print int
	move $a0, $t3
	syscall

	add $t5, $t5, 1 #contador
	j  loop2

    end_loop2:
	jr $ra