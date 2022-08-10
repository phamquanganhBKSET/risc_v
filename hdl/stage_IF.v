`include "../inc/risc_v_defines.vh"

module stage_IF #(
  parameter MEM_WIDTH  = `MEM_WIDTH ,
  parameter PC_WIDTH   = `PC_WIDTH  ,
  parameter INST_WIDTH = `INST_WIDTH 
)
(
  input                       clk        , // Clock signal
  input                       reset_n    , // Asynchronous reset
  // input      [PC_WIDTH-1:0  ] wr_addr    , // Write address (write instructions to IMEM)
  // input      [INST_WIDTH-1:0] wr_data    , // Data written (write instructions to IMEM)
  input      [PC_WIDTH-1:0  ] pc_imm     , // Program counter
  input                       pc_sel     , // PC select
  input                       pc_write   , // PC write
  input                       IF_flush   , // IF flush
  input                       IF_ID_write, // IF/ID write
  output reg [PC_WIDTH-1:0  ] pc         , // PC register
  output     [PC_WIDTH-1:0  ] pc_next    , // PC next
  output     [INST_WIDTH-1:0] inst         // Instruction
);

  //============================================
  //      Internal signals and variables
  //============================================

  wire [PC_WIDTH-1:0] pre_pc; // Pre PC

  //----------------------------------------------------------------
//         Intruction Memory
//----------------------------------------------------------------
localparam [31:0] NONE    = 32'h0000, // Nothing
                  INST1   = 32'h0004, // add  x8 ,x12   ,x14        --> 0000000_01110_01100_000_01000_0110011
                  INST2   = 32'h0008, // sub  x10,x12   ,x8         --> 0100000_01000_01100_000_01010_0110011
                  INST3   = 32'h000C, // addi x15,x10    ,-50       --> 111111001110_01010_000_01111_0010011
                  INST4   = 32'h0010, // lw   x14, 8(x2)            --> 000000001000_00010_010_01110_0000011
                  INST5   = 32'h0014, // add  x5 ,x19   , x14       --> 0000000_01110_10011_000_00101_0110011
                  INST6   = 32'h0018, // sw   x14, 4(x2)            --> 0000000_01110_00010_010_00100_0100011
                  INST7   = 32'h001C, // beq  x1 , x10 , offset(12) --> 0_000000_01010_00001_000_1100_0_1100011
                  INST8   = 32'h0020, // lw   x7 ,20(x5)            --> 000000010100_00101_010_00111_0000011
                  INST9   = 32'h0024, // addi x7 ,x11   ,2          --> 000000000010_01011_000_00111_0010011
                  INST10  = 32'h0028, // sw   x7 ,12(x5)            --> 000000000111_00101_010_01100_0100011
                  INST11  = 32'h002C, // sub  x2 ,x11   ,x7         --> 0100000_00111_01011_000_00010_0110011
                  INST12  = 32'h0030, // and  x14,x5    ,x3         --> 0000000_00011_00101_111_01110_0110011
                  INST13  = 32'h0034, // sw   x14,16(x5)            --> 000000001110_00101_010_10000_0100011
                  INST14  = 32'h0038, // beq  x1, x14 , offset(12)  --> 0_000000_01110_00001_000_1100_0_1100011 ; beq  x7, x13 , offset(12)  --> 0_000000_01101_00111_000_1100_0_1100011
                  INST15  = 32'h003C, // add  x8 ,x12   ,x14        --> 0000000_01110_01100_000_01000_0110011
                  INST16  = 32'h0040, // sub  x10,x12   ,x8         --> 0100000_01000_01100_000_01010_0110011
                  INST17  = 32'h0044, // addi x15,x10    ,-50       --> 111111001110_01010_000_01111_0010011
                  INST18  = 32'h0048, // lw   x14, 8(x2)            --> 000000001000_00010_010_01110_0000011
                  INST19  = 32'h004C, // add  x5 ,x19   , x14       --> 0000000_01110_10011_000_00101_0110011
                  INST20  = 32'h0050, // lw   x14, 10(x2)           --> 000000001010_00010_010_01110_0000011
                  INST21  = 32'h0054, // beq  x1, x14 , offset(12)  --> 0_000000_01110_00001_000_1100_0_1100011
                  INST22  = 32'h0058; // add  x15 ,x12   ,x14       --> 0000000_01110_01100_000_01111_0110011

  //============================================
  //                PC update
  //============================================

  assign pre_pc = pc_sel ? pc_imm : (pc+4);

  always @(posedge clk or negedge reset_n) begin : proc_pc
    if(~reset_n) begin
      pc <= 0;
    end else begin
      if (pc_write) begin
        pc = pre_pc;
      end
    end
  end

  //============================================
  //                 PC next
  //============================================

  assign pc_next = pc + 4;

  //============================================
  //               Instruction
  //============================================

  IMEM #(
    .MEM_WIDTH (MEM_WIDTH ),
    .PC_WIDTH  (PC_WIDTH  ),
    .INST_WIDTH(INST_WIDTH)        
  ) imem (
    .clk    (clk        ),
    .reset_n(reset_n    ),
    .wr_en  (IF_ID_write),
    // .wr_addr(wr_addr    ),
    // .wr_data(wr_data    ),
    .pc     (pc         ),
    .inst   (inst       ) 
  );

endmodule