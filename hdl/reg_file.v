`include "../inc/risc_v_defines.vh"

module reg_file #(
  parameter NUM_REG        = `NUM_REG       ,
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH,
  parameter REG_WIDTH      = `REG_WIDTH      
)
(
  input                       clk     , // Clock signal
  input                       reset_n , // Asynchronous reset
  input                       wr_en   , // Write enable: if wr_en == 1 then write, else read
  input  [REG_ADDR_WIDTH-1:0] addr_rs1, // Address rs1
  input  [REG_ADDR_WIDTH-1:0] addr_rs2, // Address rs2
  input  [REG_ADDR_WIDTH-1:0] addr_rd , // Address rd
  input  [REG_WIDTH-1:0     ] data_rd , // Data rd
  output [REG_WIDTH-1:0     ] data_rs1, // Data rs1
  output [REG_WIDTH-1:0     ] data_rs2  // Data rs2
);

  //============================================
  //      Internal signals and variables
  //============================================

  reg [REG_WIDTH-1:0] regs [0:NUM_REG-1]; // Register File

  //============================================
  //         Write to Register File
  //============================================

  always @(posedge clk or negedge reset_n) begin : proc_regs
    if (wr_en) begin
      regs[addr_rd] <= data_rd;
    end
  end

  //============================================
  //              Read from DMEM
  //============================================

  always @(negedge clk or negedge reset_n) begin : proc_data_out
    if(~reset_n) begin
      data_rs1 <= 0;
      data_rs2 <= 0;
    end else begin
      data_rs1 <= regs[addr_rs1];
      data_rs2 <= regs[addr_rs2];
    end
  end

endmodule