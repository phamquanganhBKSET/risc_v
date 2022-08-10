`include "../inc/risc_v_defines.vh"

module stage_EX (
  input                 clk               , // Clock signal
  input                 reset_n           , // Asynchronous reset
  input [REG_WIDTH-1:0] ID_EX_data_out_1  , // ID/EX Data rs1
  input [REG_WIDTH-1:0] ID_EX_data_out_2  , // ID/EX Data rs2
  input [REG_WIDTH-1:0] ID_EX_imm_out     , // ID/EX Immediate out
  input [REG_WIDTH-1:0] EX_MEM_alu_out    , // EX/MEM ALU out
  input [2:0          ] ID_EX_alu_sel     , // ID/EX ALU select
  input                 ID_EX_ASel        , // A select
  input                 ID_EX_BSel        , // B select
);

endmodule : stage_EX