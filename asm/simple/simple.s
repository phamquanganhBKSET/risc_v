add  x8 ,x12,x14          
sub  x10,x12,x8   
addi x15,x10,-50          
lw   x14, 8(x2)           
add  x5 ,x19, x14         
sw   x14, 4(x2)    

jal x10, L2

beq  x1 , x10 , L1
lw   x7 ,20(x5)           
addi x7 ,x11 ,2         
sw   x7 ,12(x5)           
sub  x2 ,x11 ,x7        
and  x14, x5 ,x3 
L1:  
sw   x14,16(x5)           
beq  x1, x1 , L2
add  x8 ,x12   ,x14       
sub  x10,x12   ,x8   
L2:  
addi x15, x10 ,-50      
jal x15, L3
lw   x14, 8(x2)           
add  x5 ,x14   , x19      
lw   x14, 20(x2)          
beq  x14, x1 , L3
add  x15 ,x12   ,x14    
L3:
addi x10, x0, 10
addi x14, x0, -10
bltu x10, x14, L4
beq x2, x15, L1
add x5, x6, x7
L4:
and x7, x5, x6