.data
 out_string1: .asciiz "\nEl primer lado del triangulo:\n"
 out_string2: .asciiz "\nEl segundo lado del triangulo:\n"
 out_string3: .asciiz "\nEl tercer lado del triangulo:\n"
 out_string4: .asciiz "\n  El triangulo es valido:\n"
 out_string5: .asciiz "\n EL triangulo  no es valido:\n"

.text

main:
  #primer lado del triangulo
  li $v0, 4 #muestra texto
  la $a0, out_string1
  syscall

  li $v0, 5
  syscall
  move $a1, $v0

  #segundo lado del triangulo
  li $v0, 4 
  la $a0, out_string2 #muestra texto
  syscall

  li $v0, 5
  syscall
  move $t2, $v0

  #tercer lado del triangulo
  li $v0, 4 
  la $a0, out_string3 #muestra texto
  syscall

  li $v0, 5
  syscall

  move $t3, $v0

  add $a0, $a1, $t2 # a+b>c
  bgtu $a0, $t3, et0 #Branch if (unsigned) a0 > (unsigned) a1


  LABEL_ELSE_0:
    la $a0, out_string4 #muestra texto
    b END_LABEL_IF

  et0:
    la $a0,out_string5 

  add $a0, $t2, $t3 #c+b>a
  bgtu $a1, $a0, et1 #Branch if (unsigned) a0 > (unsigned) a1
  

  LABEL_ELSE_1:
    la $a0, out_string4 #muestra texto
    b END_LABEL_IF

  et1:
    la $a0, out_string5 #muestra texto

  add $a0, $a1, $t3
  bgtu $t2, $a0, et2 #a+c>b
 
 
  LABEL_ELSE_2:
    la $a0, out_string4 #muestra texto
    b END_LABEL_IF

  et2:
    la $a0,out_string5 #muestra texto

  END_LABEL_IF:
    li $v0, 4
    syscall

  jr $ra