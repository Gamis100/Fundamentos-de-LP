.data
ingrese_num: .asciiz "\n Ingrese un numero: "
noprimo: .asciiz "\n El numero no es primo"
primo: .asciiz "\n El numero es primo"

.text

main:	
        li $v0, 4
	la $a0, ingrese_num  #ingrese numero
	syscall
	li $v0, 5 
	syscall
	move $t0, $v0 
	li $t1, 2
	
loop1:   
        beq $t0, $t1 si_primo  #verifica 
	div $t0, $t1 #division 
	mfhi $t2 #mueve 
	beqz $t2, no_primo  
	addi $t1, $t1 1
	j loop1
	
no_primo:
	li $v0, 4
	la $a0, noprimo   #no_primos
	syscall
	j exit
	
si_primo:
	li $v0, 4
	la $a0, primo #primos
	syscall
	j exit
	
exit:	li $v0, 10 
	syscall