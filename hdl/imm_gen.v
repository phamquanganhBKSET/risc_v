`include "../inc/risc_v_defines.vh"

module imm_gen #(
  parameter IMM_WIDTH     = `IMM_WIDTH,
  parameter IMM_SEL_WIDTH = `IMM_SEL_WIDTH,
  parameter REG_WIDTH     = `REG_WIDTH 
)
(
  input      [IMM_WIDTH-1:0    ] imm_in , // Immediate in
  input      [IMM_SEL_WIDTH-1:0] imm_sel, // Immediate select
  output reg [REG_WIDTH-1:0    ] imm_out  // Immediate out
);

  always @(*) begin : proc_imm_out
    imm_out = 0;
    case (imm_sel)
      `IMM_SEL_I : begin
        imm_out = {};
      end

      `IMM_SEL_S : begin
        imm_out = {};
      end

      `IMM_SEL_B : begin
        imm_out = {};
      end
    endcase
  end

endmodule