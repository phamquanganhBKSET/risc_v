nop
add  x8 ,x12,x14          
sub  x10,x12,x8   
addi x15,x10,-50          
lw   x14, 8(x2)           
add  x5 ,x19, x14         
sw   x14, 4(x2)    
test:  
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
lw   x14, 8(x2)           
add  x5 ,x14   , x19      
lw   x14, 20(x2)          
beq  x14, x1 , L3
add  x15 ,x12   ,x14      
jal x1, x1, test
L3:
add x5, x6, x7