.global main

.data
x: .word 2
n: .word 4

.text
main: 	lw $a0,x 	#a0:=x
	lw $a1,n 	#a1:=n
	jal potega	#v0:=potega(x,n)
	move $a0,$v0	#a0:=potega(x,n)
	li $v0,1	#v0:=1
	syscall		#printp otega(x,n)
	li $v0,10	#v0:=10
	syscall		#exit
	
# potega(x,n) $v0=potega($a0,$a1)
potega: bne $a1,$zero,else	#if (n==) then go to else
	li $v0,1		#v0:=1
	j koniec		#skocz do obs³ugi koñca procedury
	
else:	addi $sp,$sp,-8		#zrób na stosie miejsce na dwa elementy
	sw $ra,4($sp)		#wepchnij na stos $ra
	sw $a1,0($sp)		#wepchnij na stos a1=n	
	addi $a1,$a1,-1		#a1:=n-1
	jal potega		#v0:=potega(x,n-1)
	lw $a1,0($sp)		#przywróc $a1=n ze stosu
	lw $ra,4($sp)		#przywróc $ra ze stosu
	addi $sp,$sp,8		#zwolnij na stosie miejsce po dwóch elementach
	mul $v0,$a0,$v0		#v0:=x*potega(x,n-1)
	
koniec:	jr $ra			#wyjdŸ z procedury
