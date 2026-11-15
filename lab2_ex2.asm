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

sll $t0,$s3,2   #t0:=4i
add $t0,$s6,$t0 #t0:=&A+4i
lw $t0,0($t0)   #t0:=A[i]

sll $t1,$s4,2   #t1:=4j
add $t1,$s6,$t1 #t1:=&A+4j
lw $t1,0($t1)   #t1:=A[j]

add $t2,$t0,$t1 #t2:=A[i]+A[j]
sw $t2,32($s7)  #B[8]:=A[i]+A[j]

li $v0,10
syscall