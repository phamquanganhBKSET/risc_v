`include "../inc/risc_v_defines.vh"

module stage_WB #(
  parameter REG_WIDTH = `REG_WIDTH
)(
  input                           clk                ,  // Clock
  input                           reset_n            ,  // Asynchronous reset active low
  input                           MEM_WB_reg_wb_sel  ,   
  input      [REG_WIDTH-1:0     ] MEM_WB_alu_out     ,  // ALU out
  input      [REG_WIDTH-1:0     ] MEM_WB_data_out    ,  // DMEM data out
  output reg [REG_WIDTH-1:0     ] WB_data               // wb_data to register file
);

always @(*) begin
  WB_data = MEM_WB_reg_wb_sel ? MEM_WB_alu_out : MEM_WB_data_out;

end

endmodule : stage_WB