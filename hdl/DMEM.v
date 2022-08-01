`include "../inc/risc_v_defines.vh"

module DMEM #(
  parameter MEM_WIDTH       = `MEM_WIDTH      ,
  parameter DMEM_ADDR_WIDTH = `DMEM_ADDR_WIDTH,
  parameter REG_WIDTH       = `REG_WIDTH       
)
(
  input                        clk     , // Clock signal
  input                        reset_n , // Asynchronous reset
  input                        wr_en   , // Write enable: if wr_en == 1 then write, else read
  input  [DMEM_ADDR_WIDTH-1:0] addr    , // Write address or read address
  input  [REG_WIDTH-1:0      ] wr_data , // Data written
  output [REG_WIDTH-1:0      ] data_out  // Read data
);

  //============================================
  //      Internal signals and variables
  //============================================

  reg [MEM_WIDTH-1:0] dmem [0:DMEM_DEPTH-1]; // DMEM

  //============================================
  //               Write to DMEM
  //============================================

  always @(posedge clk or negedge reset_n) begin : proc_dmem
    if (wr_en) begin
      dmem[addr  ] <= wr_data[7 :0 ];
      dmem[addr+1] <= wr_data[15:8 ];
      dmem[addr+2] <= wr_data[23:16];
      dmem[addr+3] <= wr_data[31:24];
    end
  end

  //============================================
  //              Read from DMEM
  //============================================

  always @(posedge clk or negedge reset_n) begin : proc_data_out
    if(~reset_n) begin
      data_out <= 0;
    end else begin
      data_out <= {dmem[addr + 3], dmem[addr + 2], dmem[addr + 1], dmem[addr]}; // Little endian
    end
  end

endmodule