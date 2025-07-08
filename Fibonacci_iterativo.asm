.data
mensaje:      .asciiz "Ingresa el número n: "
resultado:  .asciiz "El término n de la sucesión de Fibonacci es: "

.text
.globl main

main:
    # Mostrar mensaje de entrada
    li $v0, 4
    la $a0, mensaje
    syscall

    # Leer número n del usuario
    li $v0, 5
    syscall
    move $t0, $v0     # n

    # Casos base: si n == 0, resultado = 0
    beqz $t0, caso_cero

    # si n == 1, resultado = 1
    li $t1, 1
    beq $t0, $t1, caso_uno

    # Inicializar 
    li $t1, 0      
    li $t2, 1      
    li $t3, 2      # contador i = 2

loop:
    add $t4, $t1, $t2   
    move $t1, $t2       
    move $t2, $t4       
    addi $t3, $t3, 1    # i++

    ble $t3, $t0, loop

    j mostrar

caso_cero:
    li $t2, 0
    j mostrar

caso_uno:
    li $t2, 1

mostrar:
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall


