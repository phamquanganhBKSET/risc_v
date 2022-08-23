//---------------------------------------------------------------
//                        RISC-V Core
//                          Ver 1.0
//                     EDABK  Laboratory
//                      Copyright  2022
//---------------------------------------------------------------
//    Copyright © 2022 by EDABK Laboratory
//    All rights reserved.
//
//    Module  : DMEM
//    Project : RISC-V 5-stage pipeline
//    Author  : Pham Quang Anh, Nguyen Duc Quang, Tran Hong Nhung
//    Company : EDABK Laboratory
//----------------------------------------------------------------

`include "../inc/risc_v_defines.vh"

module DMEM #(
  parameter MEM_WIDTH       = `MEM_WIDTH      ,
  parameter DMEM_ADDR_WIDTH = `DMEM_ADDR_WIDTH,
  parameter REG_WIDTH       = `REG_WIDTH      ,
  parameter DMEM_DEPTH      = `DMEM_DEPTH      
)
(
  input                            clk     , // Clock signal
  input                            reset_n , // Asynchronous reset
  input                            wr_en   , // Write enable: if wr_en == 1 then write, else read
  input      [DMEM_ADDR_WIDTH-1:0] addr    , // Write address or read address
  input      [REG_WIDTH-1:0      ] wr_data , // Data written
  output reg [REG_WIDTH-1:0      ] data_out  // Read data
);

  //============================================
  //      Internal signals and variables
  //============================================

  reg [MEM_WIDTH-1:0] dmem [0:DMEM_DEPTH-1]; // DMEM


  //============================================
  //               Write to DMEM
  //============================================

  integer i;
  always @(posedge clk or negedge reset_n) begin : proc_dmem
    if (~reset_n) begin
      for (i = 0; i < DMEM_DEPTH; i = i + 4) begin
        {dmem[i+3], dmem[i+2], dmem[i+1], dmem[i]} <= (DMEM_DEPTH - i) / 4 % 20;
      end
    end else if (wr_en) begin
      {dmem[addr+3], dmem[addr+2], dmem[addr+1], dmem[addr]} <= wr_data;
    end
  end

  //============================================
  //              Read from DMEM
  //============================================

  always @(negedge clk or negedge reset_n) begin : proc_data_out
    if(~reset_n) begin
      data_out <= 0;
    end else begin
      if (!wr_en) begin
        data_out <= {dmem[addr + 3], dmem[addr + 2], dmem[addr + 1], dmem[addr]}; // Little endian
      end else begin
        data_out <= 0;
      end
    end
  end

endmodule