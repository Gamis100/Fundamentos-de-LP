 .data# Data declaration section
	
	out_string1: .asciiz "\nIngrese un numero:\n"
	num_inversos: .asciiz "\nLos elementos en orden inverso son:"
    array_1: .word 1:5 #array 
.text # Assembly language instructions
main: # Start of code section

	la $t5, array_1
#inicio del  ciclo 
loop1: 
	beq $t0, 5 end_loop1

	li $v0, 4
 	la $a0, out_string1 #imprime un numero
 	syscall

 	li $v0, 5
 	syscall
 	move $a0, $v0
 	sw $a0, 0($t5) 
 	add $t5, $t5, 4
 	add $t0, $t0, 1
	j loop1 # regresa al inicio del ciclo

end_loop1:

	li $t0, 0
    li $v0, 4
 	la $a0, num_inversos
 	syscall

        # segundo ciclo

	loop2:
		beq $t0, 5 end_loop2
		sub $t5, $t5, 4
		lw $t3, 0($t5)

		li $v0, 1 #imprime los enteros en forma inversa
		move $a0, $t3
		syscall

		li $a0, 32 #print space
		li $v0, 11 #código  para imprimir un carácter
		syscall

		add $t0, $t0, 1 #contador
		j loop2 # regresa al inicio del ciclo

	end_loop2:
		jr $ra
			