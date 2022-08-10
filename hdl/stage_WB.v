`include "../inc/risc_v_defines.vh"

module stage_WB #(
  parameter REG_WIDTH = `REG_WIDTH
)(
  input                           clk                ,  // Clock
  input                           reset_n            ,  // Asynchronous reset active low
  input                           MEM_WB_reg_wb_sel  ,   
  input      [REG_WIDTH-1:0     ] MEM_WB_alu_out     ,  // ALU out
  input      [REG_WIDTH-1:0     ] EX_MEM_alu_out     ,  // ALU out
  input                           EX_MEM_reg_write_en,  // ID/EX Reg write enable
  output reg [REG_WIDTH-1:0     ] WB_data               // wb_data to register file
);

always @(*) begin
  WB_data = MEM_WB_reg_wb_sel ? MEM_WB_alu_out : EX_MEM_alu_out;

end

endmodule : stage_WB