`include "../inc/risc_v_defines.vh"

module stage_EX #(
  parameter REG_WIDTH = `REG_WIDTH
)
(
  input                      clk             , // Clock signal
  input                      reset_n         , // Asynchronous reset
  input      [1:0          ] forwardA        , // Forward A
  input      [1:0          ] forwardB        , // Forward B
  input      [REG_WIDTH-1:0] ID_EX_data_out_1, // ID/EX Data rs1
  input      [REG_WIDTH-1:0] ID_EX_data_out_2, // ID/EX Data rs2
  input      [REG_WIDTH-1:0] ID_EX_imm_out   , // ID/EX Immediate out
  input      [REG_WIDTH-1:0] WB_data          , // WB data
  input      [REG_WIDTH-1:0] EX_MEM_alu_out  , // EX/MEM ALU out
  input      [2:0          ] ID_EX_alu_sel   , // ID/EX ALU select
  input                      ID_EX_ASel      , // A select
  input                      ID_EX_BSel      , // B select
  output     [REG_WIDTH-1:0] alu_out         , // ALU out
  output reg [REG_WIDTH-1:0] dataB             // Data B
);

  //============================================
  //        Internal signals and variables
  //============================================

  reg  [REG_WIDTH-1:0] dataA;
  wire [REG_WIDTH-1:0] alu_in_B;

  //============================================
  //                    Data A
  //============================================

  always @(*) begin : proc_data_A
    dataA = 0;
    case (forwardA)
      2'b00: begin
        dataA = ID_EX_data_out_1;
      end

      2'b01: begin
        dataA = WB_data;
      end

      2'b10: begin
        dataA = EX_MEM_alu_out;
      end
    endcase
  end

  //============================================
  //                    Data B
  //============================================

  always @(*) begin : proc_data_B
    dataB = 0;
    case (forwardB)
      2'b00: begin
        dataB = ID_EX_data_out_2;
      end

      2'b01: begin
        dataB = WB_data;
      end

      2'b10: begin
        dataB = EX_MEM_alu_out;
      end
    endcase
  end

  //============================================
  //                     ALU
  //============================================

  assign alu_in_B = ID_EX_BSel ? ID_EX_imm_out : dataB;

  alu #(
    .REG_WIDTH(REG_WIDTH)
  ) alu_inst (
    .alu_sel(ID_EX_alu_sel),
    .dataA  (dataA        ),
    .dataB  (alu_in_B     ),
    .alu_out(alu_out      ) 
  );

endmodule : stage_EX