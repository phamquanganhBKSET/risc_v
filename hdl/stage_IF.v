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