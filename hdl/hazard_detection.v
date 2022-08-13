`include "../inc/risc_v_defines.vh"

module hazard_detection #(
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH
)
(
  input  [6:0               ] ID_EX_inst_opcode, // ID/EX instruction opcode
  input  [REG_ADDR_WIDTH-1:0] IF_ID_rs1        , // IF/ID.RegisterRs1
  input  [REG_ADDR_WIDTH-1:0] IF_ID_rs2        , // IF/ID.RegisterRs2
  input  [REG_ADDR_WIDTH-1:0] ID_EX_rd         , // ID/EX.RegisterRd
  input                       ID_EX_mem_wr_en  , // ID/EX Mem write enable
  output                      ctrl_sel         , // Control select
  output                      pc_write         , // PC Write
  output                      IF_ID_write        // IF/ID Write
);

  //============================================
  //   IF/ID write when mem data hazard occurs
  //============================================

  assign IF_ID_write = !((ID_EX_inst_opcode == 7'b0000011) & (!ID_EX_mem_wr_en) & (ID_EX_rd != 0) & (IF_ID_rs1 != 0) & (IF_ID_rs2 != 0) & ((ID_EX_rd == IF_ID_rs1) | (ID_EX_rd == IF_ID_rs2))); // Load instruction

  //============================================
  //                  PC Write
  //============================================

  assign pc_write = !((ID_EX_inst_opcode == 7'b0000011) & (!ID_EX_mem_wr_en) & (ID_EX_rd != 0) & (IF_ID_rs1 != 0) & (IF_ID_rs2 != 0) & ((ID_EX_rd == IF_ID_rs1) | (ID_EX_rd == IF_ID_rs2))); // Load instruction

  //============================================
  // Control select when mem data hazard occurs
  //============================================

  assign ctrl_sel = !((ID_EX_inst_opcode == 7'b0000011) & (!ID_EX_mem_wr_en) & (ID_EX_rd != 0) & (IF_ID_rs1 != 0) & (IF_ID_rs2 != 0) & ((ID_EX_rd == IF_ID_rs1) | (ID_EX_rd == IF_ID_rs2))); // Load instruction

endmodule