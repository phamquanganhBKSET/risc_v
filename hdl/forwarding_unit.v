`include "../inc/risc_v_defines.vh"

module forwarding_unit #(
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH
)
(
  input      [6:0               ] IF_ID_inst_opcode, // IF/ID opcode
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rs1        , // IF/ID.RegisterRs1
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rs2        , // IF/ID.RegisterRs2
  input                           ID_EX_reg_wr_en  , // ID/EX Reg write enable
  input      [REG_ADDR_WIDTH-1:0] ID_EX_rs1        , // ID/EX.RegisterRs1
  input      [REG_ADDR_WIDTH-1:0] ID_EX_rs2        , // ID/EX.RegisterRs2
  input      [REG_ADDR_WIDTH-1:0] ID_EX_rd         , // ID/EX.RegisterRd
  input                           EX_MEM_reg_wr_en , // EX/MEM Reg write enable
  input      [REG_ADDR_WIDTH-1:0] EX_MEM_rd        , // EX/MEM.RegisterRd
  input                           MEM_WB_reg_wr_en , // MEM/WB Reg write enable
  input      [REG_ADDR_WIDTH-1:0] MEM_WB_rd        , // MEM/WB.RegisterRd
  output reg [1:0               ] forwardA         , // Forwarding A
  output reg [1:0               ] forwardB         , // Forwarding B
  output reg [1:0               ] forward_comp1    , // Forwarding compare 1
  output reg [1:0               ] forward_comp2      // Forwarding compare 2
);

  //============================================
  //      Internal signals and variables
  //============================================

  wire branch_inst; // Check if instruction is branch type

  //============================================
  //                Check opcode
  //============================================

  assign branch_inst = (IF_ID_inst_opcode == 7'b1100011);

  //============================================
  //            Forwarding compare 1
  //============================================

  always @(*) begin : proc_forward_comp1
    if (branch_inst && (ID_EX_rd != 0) && ID_EX_reg_wr_en && (IF_ID_rs1 == ID_EX_rd)) begin
      forward_comp1 = 2'b01;
    end else if (branch_inst && (EX_MEM_rd != 0) && EX_MEM_reg_wr_en && (EX_MEM_rd == IF_ID_rs1)) begin
      forward_comp1 = 2'b10;
    end else if (MEM_WB_reg_wr_en & (MEM_WB_rd != 0) & (MEM_WB_rd == IF_ID_rs1)) begin
      forward_comp1 = 2'b11;
    end else begin
      forward_comp1 = 2'b00;
    end
  end

  //============================================
  //            Forwarding compare 1
  //============================================

  always @(*) begin : proc_forward_comp2
    if (branch_inst && (EX_MEM_rd != 0) && EX_MEM_reg_wr_en && (EX_MEM_rd == IF_ID_rs2)) begin
      forward_comp2 = 2'b10;
    end else if (branch_inst && (ID_EX_rd != 0) && ID_EX_reg_wr_en && (IF_ID_rs2 == ID_EX_rd)) begin
      forward_comp2 = 2'b01;
    end else if (MEM_WB_reg_wr_en & (MEM_WB_rd != 0) & (MEM_WB_rd == IF_ID_rs2)) begin
      forward_comp2 = 2'b11;
    end else begin
      forward_comp2 = 2'b00;
    end
  end

  //============================================
  //                Forwarding A
  //============================================

  always @(*) begin : proc_forwardA
    if (EX_MEM_reg_wr_en & (EX_MEM_rd != 0) & (EX_MEM_rd == ID_EX_rs1)) begin
      forwardA = 2'b10;
    end else if (MEM_WB_reg_wr_en & (MEM_WB_rd != 0) & (MEM_WB_rd == ID_EX_rs1)) begin
      forwardA = 2'b01;
    end else begin
      forwardA = 2'b00;
    end
  end

  //============================================
  //                Forwarding B
  //============================================

  always @(*) begin : proc_forwardB
    if (EX_MEM_reg_wr_en & (EX_MEM_rd != 0) & (EX_MEM_rd == ID_EX_rs2)) begin
      forwardB = 2'b10;
    end else if (MEM_WB_reg_wr_en & (MEM_WB_rd != 0) & (MEM_WB_rd == ID_EX_rs2)) begin
      forwardB = 2'b01;
    end else begin
      forwardB = 2'b00;
    end
  end

endmodule