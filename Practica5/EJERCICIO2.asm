.data # Data declaration section	
 ingrese_num:.asciiz  "Ingrese un numero:\n"
 impares: .asciiz "\nLos numeros impares hasta "
 num: .asciiz " son: "
.text # Assembly language instructions
main:
	li $v0, 4
	la $a0, ingrese_num #ingrese numero
	syscall 

	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, impares #impares
	syscall	

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, num   #imprime los  numeros
	syscall

	li $t1, 1
	loop1:
		bge $t1, $t0 end_loop1 
		
		li $v0, 1
		move $a0, $t1 
		syscall 

		li $a0, 32 #print space
		li $v0, 11 #imprimir  carácter
		syscall
		
		add $t1, $t1, 2
		j loop1

        end_loop1:
                li $v0, 10
                syscall