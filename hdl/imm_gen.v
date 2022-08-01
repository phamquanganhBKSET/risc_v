`include "../inc/risc_v_defines.vh"

module imm_gen #(
  parameter INST_WIDTH    = `INST_WIDTH   ,
  parameter IMM_SEL_WIDTH = `IMM_SEL_WIDTH,
  parameter REG_WIDTH     = `REG_WIDTH     
)
(
  input      [INST_WIDTH-1:0   ] inst   , // Immediate in
  input      [IMM_SEL_WIDTH-1:0] imm_sel, // Immediate select
  output reg [REG_WIDTH-1:0    ] imm_out  // Immediate out
);

  always @(*) begin : proc_imm_out
    imm_out = 0;
    case (imm_sel)
      `IMM_SEL_I : begin
        imm_out = {{20{inst[31]}}, inst[31:25], inst[24:21], inst[20]};
      end

      `IMM_SEL_S : begin
        imm_out = {{20{inst[31]}}, inst[31:25], inst[11:8], inst[7]};
      end

      `IMM_SEL_B : begin
        imm_out = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
      end

      `IMM_SEL_J : begin
        imm_out = {{19{inst[31]}}, inst[31:20], 1'b0};
      end
    endcase
  end

endmodule