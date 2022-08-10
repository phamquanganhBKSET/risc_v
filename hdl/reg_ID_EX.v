`include "../inc/risc_v_defines.vh"

module reg_ID_EX #(
  parameter REG_WIDTH = `REG_WIDTH
)
(
  input                           clk               , // Clock signal
  input                           reset_n           , // Asynchronous reset
  input      [6:0               ] IF_ID_inst_opcode , // IF/ID instruction opcode
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rs1         , // IF/ID.RegisterRs1
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rs2         , // IF/ID.RegisterRs2
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rd          , // IF/ID.RegisterRd
  input                           pc_sel            , // PC select
  input                           ctr_sel           , // Control select
  input      [REG_WIDTH-1:0     ] data_out_1        , // Data out rs1
  input      [REG_WIDTH-1:0     ] data_out_2        , // Data out rs2
  input      [REG_WIDTH-1:0     ] imm_out           , // Immediate out
  input                           reg_write_en      , // Reg write enable
  input      [2:0               ] alu_sel           , // ALU select
  input                           mem_write_en      , // MEM write enable
  input                           ASel              , // A select
  input                           BSel              , // B select
  input                           wb_sel            , // WB select
  output     [6:0               ] ID_EX_inst_opcode , // IF/ID instruction opcode
  output     [REG_ADDR_WIDTH-1:0] ID_EX_rs1         , // IF/ID.RegisterRs1
  output     [REG_ADDR_WIDTH-1:0] ID_EX_rs2         , // IF/ID.RegisterRs2
  output     [REG_ADDR_WIDTH-1:0] ID_EX_rd          , // IF/ID.RegisterRd
  output reg                      ID_EX_pc_sel      , // ID/EX PC select
  output reg [REG_WIDTH-1:0     ] ID_EX_data_out_1  , // ID/EX Data rs1
  output reg [REG_WIDTH-1:0     ] ID_EX_data_out_2  , // ID/EX Data rs2
  output reg [REG_WIDTH-1:0     ] ID_EX_imm_out     , // ID/EX Immediate out
  output reg                      ID_EX_reg_write_en, // ID/EX Reg write enable
  output reg [2:0               ] ID_EX_alu_sel     , // ID/EX ALU select
  output reg                      ID_EX_mem_write_en, // ID/EX MEM write enable
  output                          ID_EX_ASel        , // A select
  output                          ID_EX_BSel        , // B select
  output reg                      ID_EX_wb_sel        // ID/EX WB select
);

  always @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
      ID_EX_pc_sel       <= 0;
      ID_EX_data_out_1   <= 0;
      ID_EX_data_out_2   <= 0;
      ID_EX_imm_out      <= 0;
      ID_EX_reg_write_en <= 0;
      ID_EX_alu_sel      <= 0;
      ID_EX_mem_write_en <= 0;
      ID_EX_ASel         <= 0;
      ID_EX_BSel         <= 0;
      ID_EX_wb_sel       <= 0;
    end else begin
      ID_EX_pc_sel       <= ctr_sel ? pc_sel       : 0;
      ID_EX_data_out_1   <= data_out_1                ;
      ID_EX_data_out_2   <= data_out_2                ;
      ID_EX_imm_out      <= imm_out                   ;
      ID_EX_reg_write_en <= ctr_sel ? reg_write_en : 0;
      ID_EX_alu_sel      <= ctr_sel ? alu_sel      : 0;
      ID_EX_mem_write_en <= ctr_sel ? mem_write_en : 0;
      ID_EX_ASel         <= ctr_sel ? ASel         : 0;
      ID_EX_BSel         <= ctr_sel ? BSel         : 0;
      ID_EX_wb_sel       <= ctr_sel ? wb_sel       : 0;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
      ID_EX_inst_opcode <= 0;
      ID_EX_rs1         <= 0;
      ID_EX_rs2         <= 0;
      ID_EX_rd          <= 0;
    end else begin
      ID_EX_inst_opcode <= IF_ID_inst_opcode;
      ID_EX_rs1         <= IF_ID_rs1        ;
      ID_EX_rs2         <= IF_ID_rs2        ;
      ID_EX_rd          <= IF_ID_rd         ;
    end
  end

endmodule : reg_ID_EX