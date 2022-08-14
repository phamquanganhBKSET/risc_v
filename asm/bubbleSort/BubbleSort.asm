addi x4 x0 0
addi x6 x0 0    # ???
addi x7 x0 9    # last element

loop1: 
beq x6 x7 exit
sub x8 x7 x6  # x8 = 10
addi x9 x0 0  # x9 = i = 0

loop2:
beq x9 x8 next 
add x10 x9 x9 
add x10 x10 x10   # x10 = 4 * x9 = 
add x10 x10 x4    # x10 = x10 + 4 -> Tang con tro
lw x11 0(x10)     # x11 = arr[i+1]
addi x12 x10 4    # x12 = x10+4
lw x13 0(x12)     # x13 = arr[i+2]
blt x13 x11 swap  # arr[i+2] < arr[i+1] -> swap
addi x9 x9 1      # else: i += 1
jal x0 loop2  

swap:
sw x11 0(x12)
sw x13 0(x10)
addi x9 x9 1
jal x0 loop2

next:
addi x6 x6 1
jal x0 loop1

exit: 