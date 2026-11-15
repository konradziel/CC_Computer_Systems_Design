.global main

.data
i: .word 4
j: .word 2
A: .word 0,-1,-2,-3,-4
B: .word 0,1,2,3,4,5,6,7,8,9

.text
main:
lw $s3,i #s3:=i
lw $s4,j #s4:=j
la $s6,A #s6:=&A
la $s7,B #s7:=&B

sub $t0,$s3,$s4 #t0:=i-j
sll $t0,$t0,2 	#t0:=4(i-j)
add $t0,$s6,$t0 #t0:=&A+4(i-j)
lw $t0,0($t0)	#t0:=A[i-j]
sw $t0,32($s7)	#B[8]:=A[i-j]

li $v0,10
syscall