`include "../inc/risc_v_defines.vh"

module IMEM #(
  parameter MEM_WIDTH  = `MEM_WIDTH ,
  parameter PC_WIDTH   = `PC_WIDTH  ,
  parameter INST_WIDTH = `INST_WIDTH,
  parameter IMEM_DEPTH = `IMEM_DEPTH        
)
(
	input                       clk    , // Clock signal
	input                       reset_n, // Asynchronous reset
  input                       wr_en  , // Write enable
  // input      [PC_WIDTH-1:0  ] wr_addr, // Write address
  // input      [INST_WIDTH-1:0] wr_data, // Data written
	input      [PC_WIDTH-1:0  ] pc     , // Program counter
	output reg [INST_WIDTH-1:0] inst     // Instruction
);

  //============================================
  //      Internal signals and variables
  //============================================

  reg [MEM_WIDTH-1:0] imem [0:IMEM_DEPTH-1]; // IMEM

  //============================================
  //               Write to IMEM
  //============================================


  initial begin
    $readmemb(`FILE_PATH, imem);
  end

  // always @(posedge clk or negedge reset_n) begin : proc_imem
  //   if(wr_en)
  //     imem[wr_addr  ] <= wr_data[7 :0 ];
  //     imem[wr_addr+1] <= wr_data[15:8 ];
  //     imem[wr_addr+2] <= wr_data[23:16];
  //     imem[wr_addr+3] <= wr_data[31:24];
  //   end
  // end

  //============================================
  //              Read from IMEM
  //============================================

  always @(negedge clk or negedge reset_n) begin : proc_inst
    if(~reset_n) begin
      inst <= 0;
    end else begin
      if (!wr_en) begin
        inst <= {imem[pc + 3], imem[pc + 2], imem[pc + 1], imem[pc]}; // Little endian
      end
    end
  end

endmodule