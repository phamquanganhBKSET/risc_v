`include "../inc/risc_v_defines.vh"

module branch_comp #(
  parameter REG_WIDTH = `REG_WIDTH
)
(
  input                 br_un   , // Compare unsign
  input [REG_WIDTH-1:0] data_rs1, // Data rs1
  input [REG_WIDTH-1:0] data_rs2, // Data rs2
  output                br_eq   , // Branch equal
  output                br_lt     // Branch less than
);

  //===========================================================
  //                 Branch equal
  //===========================================================

  assign br_eq = br_un ? (data_rs1 == data_rs2) : ($signed(data_rs1) == $signed(data_rs2));

  //===========================================================
  //            Branch less than
  //===========================================================

  assign br_lt = br_un ? (data_rs1 < data_rs2) : ($signed(data_rs1) < $signed(data_rs2));

endmodule