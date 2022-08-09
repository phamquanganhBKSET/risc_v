`include "../inc/risc_v_defines.vh"

module stage_ID #(
  parameter PC_WIDTH   = `PC_WIDTH  ,
  parameter INST_WIDTH = `INST_WIDTH
)
(
  input                      clk              , // Clock signal
  input                      reset_n          , // Asynchronous reset
  input [PC_WIDTH-1:0      ] IF_ID_pc         , // IF/ID PC
  input [INST_WIDTH-1:0    ] IF_ID_inst       , // ID/ID instruction
  input [6:0               ] IF_ID_inst_opcode, // IF/ID instruction opcode
  input [REG_ADDR_WIDTH-1:0] IF_ID_rs1        , // IF/ID.RegisterRs1
  input [REG_ADDR_WIDTH-1:0] IF_ID_rs2        , // IF/ID.RegisterRs2
  input [REG_ADDR_WIDTH-1:0] IF_ID_rd         , // IF/ID.RegisterRd
  input                      MEM_WB_reg_wr_en , // MEM/WB RegWrite
  input                      ctr_sel          , // Control select
  input                      forward_comp1    , // Forward compare 1
  input                      forward_comp2    , // Forward compare 2

);
  
  //============================================
  //                  IF/ID PC
  //============================================

  

endmodule