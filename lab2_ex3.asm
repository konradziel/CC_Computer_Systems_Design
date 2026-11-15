.global main

.data
a: .word 4
b: .word 2
D: .word -1,-1,-1,-1,-1,

.text
main:
lw $s0,a #s0:=a
lw $s1,b #s1:=n
la $s2,D #s2:=&D

	li $t0,0 #i:=0
	slt $t2,$t0,$s0 #t2:=(i<a)

li $v0,10
syscall