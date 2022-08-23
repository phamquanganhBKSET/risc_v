# Store array: {7, 4, 5, 4, 3, 2, 1, 10, 8, 7}
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

addi x4, x0, 0      # x4 is base address
addi x6, x0, 0      # x6 = i = 0
addi x7, x0, 9      # n - 1 = 9

loop1:
beq x6, x7, exit    # if (i == n - 1) exit
sub x8, x7, x6      # x8 = x7 - x6 = n - 1 - i
addi x9, x0, 0      # x9 = j = 0

loop2:
beq x8, x9, next    # if (j == n - 1 - i) i = i + 1; else continue;
add x10, x9 , x9    # x10 = 2 * x9
add x10, x10, x10   # x10 = 4 * x9 = 4 * j
add x10, x10, x4    # x10 = &(base address + 4 * i) = &arr[j]
lw x11, 0(x10)      # x11 = arr[j]
addi x12, x10, 4    # x12 = x10 + 4 = &arr[j + 1]
lw x13, 0(x12)      # x13 = arr[j+1]
blt x13, x11, swap  # arr[j+1] < arr[j] -> swap
addi x9, x9, 1      # else j += 1
jal x0 loop2        # continue loop2

swap:
sw x11, 0(x12)      # arr[j + 1] = x11 = old arr[j]
sw x13, 0(x10)      # arr[j] = old arr[j + 1]
addi x9, x9, 1      # j = j + 1
jal x0 loop2        # continue loop2

next:
addi x6, x6, 1      # i = i + 1
jal x0 loop1        # continue loop1

exit:
addi x1, x0, 1