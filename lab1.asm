.globl main
.data
greeting: .asciiz "Hello World!"

.text
main: addi $v0,$zero,4 #v0:=4
la $a0,greeting #a0:=$greeting