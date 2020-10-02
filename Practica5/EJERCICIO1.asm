.data # Data declaration section

imgrese_num:.asciiz  "Ingrese un numero:\n"
par: .asciiz "El numero  es par "
impar:.asciiz  "El numero es impar "


.text  # Assembly language instructions

main:
addi $t0, $0, 2 
la $a0, imgrese_num   #ingrese numero
li $2, 4
syscall

li $2, 5
syscall

div $2, $t0 #division
mfhi $t1
beq $t1, $0, print_1  #impar
la $a0, impar  
li $2, 4
syscall

j fin
print_1: la $a0, par  #par
li $2, 4
syscall

j fin
fin: li $2, 10
syscall