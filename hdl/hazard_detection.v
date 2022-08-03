`include "../../inc/risc_v_defines.v"

module hazard_detection #(
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH
)
(
  input  [REG_ADDR_WIDTH-1:0] IF_ID_rs1      , // IF/ID.RegisterRs1
  input  [REG_ADDR_WIDTH-1:0] IF_ID_rs2      , // IF/ID.RegisterRs2
  input  [REG_ADDR_WIDTH-1:0] ID_EX_rd       , // ID/EX.RegisterRd
  input                       ID_EX_mem_wr_en, // ID/EX Mem write enable
  output                      ctrl_sel       , // Control select
  output                      pc_write       , // PC Write
  output                      IF_ID_flush      // IF/ID Flush
);

  //============================================
  //   IF/ID flush when mem data hazard occurs
  //============================================

  assign IF_ID_flush = (!ID_EX_mem_wr_en) & ((ID_EX_rd == IF_ID_rs1) | (ID_EX_rd == IF_ID_rs2)); // Load instruction

  //============================================
  //                  PC Write
  //============================================

  assign pc_write = (!ID_EX_mem_wr_en) & ((ID_EX_rd == IF_ID_rs1) | (ID_EX_rd == IF_ID_rs2)); // Load instruction

  //============================================
  // Control select when mem data hazard occurs
  //============================================

  assign ctrl_sel = (!ID_EX_mem_wr_en) & ((ID_EX_rd == IF_ID_rs1) | (ID_EX_rd == IF_ID_rs2)); // Load instruction

endmodule