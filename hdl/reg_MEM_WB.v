`include "../inc/risc_v_defines.vh"

module reg_MEM_WB #(
  parameter REG_WIDTH      = `REG_WIDTH     ,
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH 
)
(
  input                       clk                , // Clock signal
  input                       reset_n            , // Asynchronous reset
  input  [REG_WIDTH-1:0     ] EX_MEM_alu_out     , // ALU out
  input  [REG_WIDTH-1:0     ] EX_MEM_dataB       , // Data B
  input  [6:0               ] EX_MEM_inst_opcode , // IF/ID instruction opcode
  input  [REG_ADDR_WIDTH-1:0] EX_MEM_rs1         , // IF/ID.RegisterRs1
  input  [REG_ADDR_WIDTH-1:0] EX_MEM_rs2         , // IF/ID.RegisterRs2
  input  [REG_ADDR_WIDTH-1:0] EX_MEM_rd          , // IF/ID.RegisterRd
  input                       EX_MEM_reg_write_en, // ID/EX Reg write enable
  output [REG_WIDTH-1:0     ] MEM_WB_alu_out     , // ALU out
  output [REG_WIDTH-1:0     ] MEM_WB_dataB       , // Data B
  output [6:0               ] MEM_WB_inst_opcode , // IF/ID instruction opcode
  output [REG_ADDR_WIDTH-1:0] MEM_WB_rs1         , // IF/ID.RegisterRs1
  output [REG_ADDR_WIDTH-1:0] MEM_WB_rs2         , // IF/ID.RegisterRs2
  output [REG_ADDR_WIDTH-1:0] MEM_WB_rd          , // IF/ID.RegisterRd
  output                      MEM_WB_reg_write_en  // ID/EX Reg write enable
);

  always @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
      EX_MEM_alu_out      <= 0;
      EX_MEM_dataB        <= 0;
      EX_MEM_inst_opcode  <= 0;
      EX_MEM_rs1          <= 0;
      EX_MEM_rs2          <= 0;
      EX_MEM_rd           <= 0;
      EX_MEM_reg_write_en <= 0;
    end else begin
      MEM_WB_alu_out      <= EX_MEM_alu_out     ;
      MEM_WB_dataB        <= EX_MEM_dataB       ;
      MEM_WB_inst_opcode  <= EX_MEM_inst_opcode ;
      MEM_WB_rs1          <= EX_MEM_rs1         ;
      MEM_WB_rs2          <= EX_MEM_rs2         ;
      MEM_WB_rd           <= EX_MEM_rd          ;
      MEM_WB_reg_write_en <= EX_MEM_reg_write_en;
    end
  end

endmodule : reg_MEM_WB