//---------------------------------------------------------------
//                        RISC-V Core
//                          Ver 1.0
//                     EDABK  Laboratory
//                      Copyright  2022
//---------------------------------------------------------------
//    Copyright © 2022 by EDABK Laboratory
//    All rights reserved.
//
//    Module  : alu
//    Project : RISC-V 5-stage pipeline
//    Author  : Pham Quang Anh, Nguyen Duc Quang, Tran Hong Nhung
//    Company : EDABK Laboratory
//----------------------------------------------------------------

`include "../inc/risc_v_defines.vh"

module alu #(
  parameter REG_WIDTH = `REG_WIDTH
)
(
  input      [2:0          ] alu_sel, // ALU select
  input      [REG_WIDTH-1:0] dataA  , // Data A
  input      [REG_WIDTH-1:0] dataB  , // Data B
  output reg [REG_WIDTH-1:0] alu_out  // ALU out
);

  always @(*) begin : proc_alu_out
    alu_out = dataA;
    case (alu_sel)
      3'b000 : begin // ADD
        alu_out = dataA + dataB;
      end

      3'b001 : begin // SUB
        alu_out = dataA - dataB;
      end

      3'b010 : begin // XOR
        alu_out = dataA ^ dataB;
      end

      3'b011 : begin // OR
        alu_out = dataA | dataB;
      end

      3'b100 : begin // AND
        alu_out = dataA & dataB;
      end

      3'b101 : begin // SLL
        alu_out = dataA << dataB;
      end

      3'b110 : begin // SRL
        alu_out = dataA >> dataB;
      end

      3'b111 : begin // SRA
        alu_out = dataA >>> dataB;
      end
    endcase
  end

endmodule