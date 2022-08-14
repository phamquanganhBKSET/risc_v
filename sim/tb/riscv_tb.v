`include "../../inc/risc_v_defines.vh"


module riscv_tb #(
  parameter REG_WIDTH       = `REG_WIDTH      ,
  parameter INST_WIDTH      = `INST_WIDTH     ,
  parameter IMM_SEL_WIDTH   = `IMM_SEL_WIDTH  ,
  parameter MEM_WIDTH       = `MEM_WIDTH      ,
  parameter DMEM_ADDR_WIDTH = `DMEM_ADDR_WIDTH,
  parameter REG_ADDR_WIDTH  = `REG_ADDR_WIDTH ,
  parameter PC_WIDTH        = `PC_WIDTH       ,
  parameter IMEM_DEPTH      = `IMEM_DEPTH     ,
  parameter NUM_REG         = `NUM_REG        
) ();

reg clk    ;
reg reset_n;

riscv #(
  .REG_WIDTH      (REG_WIDTH      ),
  .INST_WIDTH     (INST_WIDTH     ),
  .IMM_SEL_WIDTH  (IMM_SEL_WIDTH  ),
  .MEM_WIDTH      (MEM_WIDTH      ),
  .DMEM_ADDR_WIDTH(DMEM_ADDR_WIDTH),
  .REG_ADDR_WIDTH (REG_ADDR_WIDTH ),
  .PC_WIDTH       (PC_WIDTH       ),
  .IMEM_DEPTH     (IMEM_DEPTH     ),
  .NUM_REG        (NUM_REG        )
) riscv (
  .clk    (clk    ),
  .reset_n(reset_n)
);

always #5 clk = ~clk;

always @(*) begin
  if (riscv.MEM_WB_inst_opcode === 7'bxxxxxxx) begin
    repeat(3) begin
      @(negedge clk);
    end
    $stop;
  end

end


initial begin
  clk = 0;
  reset_n = 0;
  @(posedge clk);
  reset_n = 1;
  repeat(200) begin
    @(negedge clk);
  end
end

endmodule : riscv_tb