nop
add  x8 ,x12,x14           
sub  x10,x12,x8            
addi x15,x10,-50           
lw   x14, 8(x2)            
add  x5 ,x19, x14          
sw   x14, 4(x2)            
beq  x1 , x10 , offset(12) 
lw   x7 ,20(x5)            
addi x7 ,x11   ,2          
sw   x7 ,12(x5)            
sub  x2 ,x11   ,x7         
and  x14,x5    ,x3         
sw   x14,16(x5)            
beq  x1, x1 , offset(6)    
add  x8 ,x12   ,x14        
sub  x10,x12   ,x8         
addi x15,x10    ,-50       
lw   x14, 8(x2)            
add  x5 ,x14   , x19       
lw   x14, 20(x2)           
beq  x14, x1 , offset(12)  
add  x15 ,x12   ,x14       