addi x1, x0, 7
sw x1, 0(x0)
addi x1, x0, 4
sw x1, 4(x0)
addi x1, x0, 5
sw x1, 8(x0)
addi x1, x0, 4
sw x1, 12(x0)
addi x1, x0, 3
sw x1, 16(x0)
addi x1, x0, 2
sw x1, 20(x0)
addi x1, x0, 1
sw x1, 24(x0)
addi x1, x0, 10
sw x1, 28(x0)
addi x1, x0, 8
sw x1, 32(x0)
addi x1, x0, 7
sw x1, 36(x0)


addi x4, x0, 0
addi x6, x0, 0
addi x7, x0, 9
loop1:
beq x6, x7, exit
sub x8, x7, x6
addi x9, x0, 0
loop2:
beq x8, x9, next
add x10, x9 , x9
add x10, x10, x10
add x10, x10, x4
lw x11, 0(x10)
addi x12, x10, 4
lw x13, 0(x12)
blt x13, x11, swap
addi x9, x9, 1
jal x0 loop2
swap:
sw x11, 0(x12)
sw x13, 0(x10)
addi x9, x9, 1
jal x0 loop2
next:
addi x6, x6, 1
jal x0 loop1
exit:
addi x1, x0, 1