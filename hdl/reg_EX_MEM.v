`include "../inc/risc_v_defines.vh"

module reg_EX_MEM #(
  parameter REG_WIDTH      = `REG_WIDTH     ,
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH 
)
(
  input                       clk                , // Clock signal
  input                       reset_n            , // Asynchronous reset
  input  [REG_WIDTH-1:0     ] alu_out            , // ALU out
  input  [REG_WIDTH-1:0     ] dataB              , // Data B
  input  [6:0               ] ID_EX_inst_opcode  , // IF/ID instruction opcode
  input  [REG_ADDR_WIDTH-1:0] ID_EX_rs1          , // IF/ID.RegisterRs1
  input  [REG_ADDR_WIDTH-1:0] ID_EX_rs2          , // IF/ID.RegisterRs2
  input  [REG_ADDR_WIDTH-1:0] ID_EX_rd           , // IF/ID.RegisterRd
  input                       ID_EX_reg_write_en , // ID/EX Reg write enable
  input                       ID_EX_mem_write_en , // ID/EX MEM write enable
  output [REG_WIDTH-1:0     ] EX_MEM_alu_out     , // ALU out
  output [REG_WIDTH-1:0     ] EX_MEM_dataB       , // Data B
  output [6:0               ] EX_MEM_inst_opcode , // IF/ID instruction opcode
  output [REG_ADDR_WIDTH-1:0] EX_MEM_rs1         , // IF/ID.RegisterRs1
  output [REG_ADDR_WIDTH-1:0] EX_MEM_rs2         , // IF/ID.RegisterRs2
  output [REG_ADDR_WIDTH-1:0] EX_MEM_rd          , // IF/ID.RegisterRd
  output                      EX_MEM_reg_write_en, // ID/EX Reg write enable
  output                      EX_MEM_mem_write_en  // ID/EX MEM write enable
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
      EX_MEM_mem_write_en <= 0;
    end else begin
      EX_MEM_alu_out      <= alu_out           ;
      EX_MEM_dataB        <= dataB             ;
      EX_MEM_inst_opcode  <= ID_EX_inst_opcode ;
      EX_MEM_rs1          <= ID_EX_rs1         ;
      EX_MEM_rs2          <= ID_EX_rs2         ;
      EX_MEM_rd           <= ID_EX_rd          ;
      EX_MEM_reg_write_en <= ID_EX_reg_write_en;
      EX_MEM_mem_write_en <= ID_EX_mem_write_en;
    end
  end

endmodule : reg_EX_MEM