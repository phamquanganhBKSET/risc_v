//---------------------------------------------------------------
//                        RISC-V Core
//                          Ver 1.0
//                     EDABK  Laboratory
//                      Copyright  2022
//---------------------------------------------------------------
//    Copyright © 2022 by EDABK Laboratory
//    All rights reserved.
//
//    Module  : branch_comp
//    Project : RISC-V 5-stage pipeline
//    Author  : Pham Quang Anh, Nguyen Duc Quang, Tran Hong Nhung
//    Company : EDABK Laboratory
//----------------------------------------------------------------

`include "../inc/risc_v_defines.vh"

module branch_comp #(
  parameter REG_WIDTH = `REG_WIDTH
)
(
  input                         pc_write, // PC write: If PC write == 0 -> can't compare
  input                         br_un   , // Compare unsign
  input  signed [REG_WIDTH-1:0] data_rs1, // Data rs1
  input  signed [REG_WIDTH-1:0] data_rs2, // Data rs2
  output                        br_eq   , // Branch equal
  output                        br_lt     // Branch less than
);

  //===========================================================
  //                 Branch equal
  //===========================================================

  // assign br_eq = br_un ? (data_rs1 == data_rs2) : ($signed(data_rs1) == $signed(data_rs2));
  assign br_eq = pc_write ? (br_un ? ({1'b0,data_rs1} == {1'b0,data_rs2}) : (data_rs1 == data_rs2)) : 0;

  //===========================================================
  //            Branch less than
  //===========================================================

  // assign br_lt = br_un ? (data_rs1 < data_rs2) : ($signed(data_rs1) < $signed(data_rs2));
  assign br_lt = pc_write ? (br_un ? ({1'b0,data_rs1} < {1'b0,data_rs2}) : (data_rs1 < data_rs2)) : 0;

endmodule