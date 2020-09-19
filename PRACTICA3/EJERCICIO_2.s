.data 	
 out_string: .asciiz "Ingrese la cantidad de numeros\n: "
 out_string1: .asciiz "Ingrese un numero \n: "
 out_string2: .asciiz "La suma es \n:"
 out_string3: .asciiz "El promedio es \n:"
 out_string4: .asciiz "El mayor es \n: "
 out_string5: .asciiz "El menor es \n: "

.text 

main: 
	li $v0, 4 #mostrar texto por consola
 	la $a0,out_string
 	syscall
        
 	li $v0, 5
 	syscall
   	move $t1, $v0
	
	li.s $f4, 1.0
	li.s $f5, 0.0
	li $t2, 0 #contador
	
	li $t1, 3
	li $t2, 2
	bge $t1, $t2, LABEL_IF  #si el primero es mayor
	
LABEL_ELSE:
	la $a0, out_string4
	b END_LABEL_IF

LABEL_IF:
	la $a0, out_string5
	
END_LABEL_IF:	
	li $v0, 4
	syscall
	
	
	Loop:
		beq $t1, $t2 Exit
		li $v0, 4    #mostrar texto por  consola
 		la $a0, out_string1 
 		syscall

		li $v0, 6
		syscall
		mov.s $f1, $f0 
        #---suma---
		add.s $f2, $f2, $f1 
		add $t2, $t2, 1 
		
		add.s $f3, $f3, $f4 # promedio
	
		j Loop
	Exit:	
	li $v0, 4 #mostrar texto o cadena
 	la $a0, out_string2
 	syscall
	
	li $v0, 2
	mov.s $f12 $f2
	syscall	

	li $v0, 4 #mostrar texto o cadena
 	la $a0, out_string3
 	syscall
	
	li $v0, 2
	div.s $f12, $f2, $f3 
	syscall
		
jr $ra