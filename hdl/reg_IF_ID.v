`include "../inc/risc_v_defines.vh"

module reg_IF_ID #(
  parameter PC_WIDTH       = `PC_WIDTH      ,
  parameter INST_WIDTH     = `INST_WIDTH    ,
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH
)
(
  input      [PC_WIDTH-1:0      ] pc               , // PC
  input      [INST_WIDTH-1:0    ] inst             , // Instruction
  output reg [PC_WIDTH-1:0      ] IF_ID_pc         , // IF_ID_PC
  output reg [INST_WIDTH-1:0    ] IF_ID_inst       , // IF_ID_inst
  output     [6:0               ] IF_ID_inst_opcode, // IF/ID instruction opcode
  output     [REG_ADDR_WIDTH-1:0] IF_ID_rs1        , // IF/ID.RegisterRs1
  output     [REG_ADDR_WIDTH-1:0] IF_ID_rs2        , // IF/ID.RegisterRs2
  output     [REG_ADDR_WIDTH-1:0] IF_ID_rd           // IF/ID.RegisterRd
);

  //============================================
  //                  IF/ID PC
  //============================================

  always @(posedge clk or negedge rst_n) begin : proc_IF_ID_pc
    if(~rst_n) begin
      IF_ID_pc <= 0;
    end else begin
      IF_ID_pc <= pc;
    end
  end

  //============================================
  //             IF/ID Instruction
  //============================================

  always @(posedge clk or negedge rst_n) begin : proc_IF_ID_inst
    if(~rst_n) begin
      IF_ID_inst <= 0;
    end else begin
      IF_ID_inst <= inst;
    end
  end

  //============================================
  //        IF/ID Instruction Opcode
  //============================================

  assign IF_ID_inst_opcode = IF_ID_inst[6:0];

  //============================================
  //           IF/ID.RegisterRs1
  //============================================

  assign IF_ID_rs1 = IF_ID_inst[19:15];

  //============================================
  //           IF/ID.RegisterRs2
  //============================================

  assign IF_ID_rs2 = IF_ID_inst[24:20];

  //============================================
  //           IF/ID.RegisterRd
  //============================================

  assign IF_ID_rd = IF_ID_inst[11:7];

endmodule