.global main

.data
a: .word 4
b: .word 2
D: .word -1,-1,-1,-1,-1

.text
main:
lw $s0,a #s0:=a
lw $s1,b #s1:=b
la $s2,D #s2:=&D

	li $t0,0 #i:=0
loop_i:
	slt $t2,$t0,$s0 #t2:=(i<a)
	beq $t2,$zero,end_i

	li $t1,0 #j:=0
	move $t3,$s2 #t3:=&D[0]
loop_j:
	slt $t2,$t1,$s1 #t2:=(j<b)
	beq $t2,$zero,end_j

	add $t4,$t0,$t1 #t4:=i+j
	sw $t4,0($t3) #D[4*j]:=i+j
	addi $t3,$t3,16 #t3:=&D[4*(j+1)]
	addi $t1,$t1,1 #j++
	j loop_j
end_j:
	addi $t0,$t0,1 #i++
	j loop_i
end_i:

li $v0,10
syscall