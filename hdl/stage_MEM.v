`include "../inc/risc_v_defines.vh"

module stage_MEM  #(
  parameter MEM_WIDTH       = `MEM_WIDTH      ,
  parameter DMEM_ADDR_WIDTH = `DMEM_ADDR_WIDTH,
  parameter REG_WIDTH       = `REG_WIDTH       
)(
	input                              clk                ,    // Clock
	input                              reset_n            ,  // Asynchronous reset active low
  input                              EX_MEM_mem_write_en,// ID/EX MEM write enable
  input         [REG_WIDTH-1:0     ] EX_MEM_alu_out     , // ALU out
  input         [REG_WIDTH-1:0     ] EX_MEM_dataB       , // Data B
  output reg    [REG_WIDTH-1:0     ] DMEM_data_out        // ALU out
);


DMEM #(
  .MEM_WIDTH      (MEM_WIDTH      ),
  .DMEM_ADDR_WIDTH(DMEM_ADDR_WIDTH),
  .REG_WIDTH      (REG_WIDTH      ) 
) DMEM (
  .clk     (clk                   )       ,// Clock signal
  .reset_n (reset_n               )       ,// Asynchronous reset
  .wr_en   (EX_MEM_mem_write_en   )       ,// Write enable: if wr_en == 1 then write, else read
  .addr    (EX_MEM_alu_out        )       ,// Write address or read address
  .wr_data (EX_MEM_dataB          )       ,// Data written
  .data_out(DMEM_data_out         )        // Read data
);



endmodule : stage_MEM