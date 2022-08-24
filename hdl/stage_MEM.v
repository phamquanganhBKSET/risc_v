//---------------------------------------------------------------
//                        RISC-V Core
//                          Ver 1.0
//                     EDABK  Laboratory
//                      Copyright  2022
//---------------------------------------------------------------
//    Copyright © 2022 by EDABK Laboratory
//    All rights reserved.
//
//    Module  : stage_MEM
//    Project : RISC-V 5-stage pipeline
//    Author  : Pham Quang Anh, Nguyen Duc Quang, Tran Hong Nhung
//    Company : EDABK Laboratory
//----------------------------------------------------------------

`include "../inc/risc_v_defines.vh"

module stage_MEM  #(
  parameter MEM_WIDTH       = `MEM_WIDTH      ,
  parameter DMEM_ADDR_WIDTH = `DMEM_ADDR_WIDTH,
  parameter REG_WIDTH       = `REG_WIDTH      ,
  parameter DMEM_DEPTH      = `DMEM_DEPTH     
)(
	input                              clk                , // Clock
	input                              reset_n            , // Asynchronous reset active low
  input                              EX_MEM_mem_write_en, // ID/EX MEM write enable
  input         [6:0               ] EX_MEM_inst_opcode , // EX/MEM opcode
  input         [REG_WIDTH-1:0     ] EX_MEM_alu_out     , // ALU out
  input         [REG_WIDTH-1:0     ] EX_MEM_dataB       , // Data B
  output        [REG_WIDTH-1:0     ] DMEM_data_out        // ALU out
);

  wire [REG_WIDTH-1:0] mem_out;
  assign DMEM_data_out = ((EX_MEM_inst_opcode == `JAL) || (EX_MEM_inst_opcode == `JALR)) ? EX_MEM_alu_out : mem_out;

DMEM #(
  .MEM_WIDTH      (MEM_WIDTH      ),
  .DMEM_ADDR_WIDTH(DMEM_ADDR_WIDTH),
  .REG_WIDTH      (REG_WIDTH      ),
  .DMEM_DEPTH     (DMEM_DEPTH     )
) DMEM (
  .clk     (clk                   )       ,// Clock signal
  .reset_n (reset_n               )       ,// Asynchronous reset
  .wr_en   (EX_MEM_mem_write_en   )       ,// Write enable: if wr_en == 1 then write, else read
  .addr    (EX_MEM_alu_out        )       ,// Write address or read address
  .wr_data (EX_MEM_dataB          )       ,// Data written
  .data_out(mem_out               )        // Read data
);



endmodule : stage_MEM