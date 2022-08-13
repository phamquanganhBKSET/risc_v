`include "../inc/risc_v_defines.vh"

module stage_ID #(
  parameter NUM_REG        = `NUM_REG       ,
  parameter REG_ADDR_WIDTH = `REG_ADDR_WIDTH,
  parameter REG_WIDTH      = `REG_WIDTH     ,
  parameter PC_WIDTH       = `PC_WIDTH      ,
  parameter INST_WIDTH     = `INST_WIDTH    ,
  parameter IMM_SEL_WIDTH  = `IMM_SEL_WIDTH  
)
(
  input                           clk              , // Clock signal
  input                           reset_n          , // Asynchronous reset
  input      [PC_WIDTH-1:0      ] IF_ID_pc         , // IF/ID PC
  input      [INST_WIDTH-1:0    ] IF_ID_inst       , // ID/ID instruction
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rs1        , // IF/ID.RegisterRs1
  input      [REG_ADDR_WIDTH-1:0] IF_ID_rs2        , // IF/ID.RegisterRs2
  input                           MEM_WB_reg_wr_en , // MEM/WB RegWrite
  input      [REG_ADDR_WIDTH-1:0] MEM_WB_rd        , // MEM/WB.RegisterRd
  input      [REG_WIDTH-1:0     ] WB_data          , // WB data
  input      [1:0               ] forward_comp1    , // Forward compare 1
  input      [1:0               ] forward_comp2    , // Forward compare 2
  input      [REG_WIDTH-1:0     ] alu_out          , // ALU out
  input      [REG_WIDTH-1:0     ] DMEM_data_out    , // DMEM data out
  output     [PC_WIDTH-1:0      ] pc_imm           , // PC immediate
  output                          pc_sel           , // PC select
  output reg [REG_WIDTH-1:0     ] data_out_1       , // Data out rs1
  output reg [REG_WIDTH-1:0     ] data_out_2       , // Data out rs2
  output     [REG_WIDTH-1:0     ] imm_out          , // Immediate out
  output                          reg_write_en     , // Reg write enable
  output     [2:0               ] alu_sel          , // ALU select
  output                          mem_write_en     , // MEM write enable
  output                          ASel             , // A select
  output                          BSel             , // B select
  output                          wb_sel           , // WB select
  output                          IF_flush           // IF flush
);
  
  //============================================
  //        Internal signals and variables
  //============================================

  wire [REG_WIDTH-1:0    ] data_rs1; // Data rs1
  wire [REG_WIDTH-1:0    ] data_rs2; // Data rs2
  wire [IMM_SEL_WIDTH-1:0] imm_sel ; // Immediate select
  wire                     br_un   ; // Branch compare unsign
  wire                     br_eq   ; // Branch equal
  wire                     br_lt   ; // Branch less than

  //============================================
  //                Register File
  //============================================

  reg_file #(
    .NUM_REG       (NUM_REG       ),
    .REG_ADDR_WIDTH(REG_ADDR_WIDTH),
    .REG_WIDTH     (REG_WIDTH     ) 
  ) reg_file_inst (
      .clk     (clk             ),
      .reset_n (reset_n         ),
      .wr_en   (MEM_WB_reg_wr_en),
      .addr_rs1(IF_ID_rs1       ),
      .addr_rs2(IF_ID_rs2       ),
      .addr_rd (MEM_WB_rd       ),
      .data_rd (WB_data         ),
      .data_rs1(data_rs1        ),
      .data_rs2(data_rs2        ) 
  );

  //============================================
  //             Immediate generator
  //============================================

  imm_gen #(
    .INST_WIDTH   (INST_WIDTH   ),
    .IMM_SEL_WIDTH(IMM_SEL_WIDTH),
    .REG_WIDTH    (REG_WIDTH    ) 
  ) imm_gen_inst (
      .inst   (IF_ID_inst),
      .imm_sel(imm_sel   ),
      .imm_out(imm_out   ) 
  );

  //============================================
  //                  PC immediate
  //============================================

  assign pc_imm = imm_out + IF_ID_pc;

  //============================================
  //                 Control logic
  //============================================

  control_logic #(
    .INST_WIDTH   (INST_WIDTH   ),
    .IMM_SEL_WIDTH(IMM_SEL_WIDTH) 
  ) control_logic_inst (
      .clk           (clk           ),
      .reset_n       (reset_n       ),
      .br_eq         (br_eq         ),
      .br_lt         (br_lt         ),
      .inst          (IF_ID_inst    ),
      .imm_sel       (imm_sel       ),
      .reg_write_en  (reg_write_en  ),
      .pc_sel        (pc_sel        ),
      .br_un         (br_un         ),
      .ASel          (ASel          ),
      .BSel          (BSel          ),
      .alu_sel       (alu_sel       ),
      .mem_write     (mem_write_en  ),
      .wb_sel        (wb_sel        ),
      .IF_flush      (IF_flush      )
  );

  //============================================
  //          Data out rs1 and data out rs2
  //============================================

  always @(*) begin : proc_data_out_1
    data_out_1 = 0;
    case (forward_comp1)
      2'b00: begin
        data_out_1 = data_rs1;
      end

      2'b01: begin
        data_out_1 = alu_out;
      end

      2'b10: begin
        data_out_1 = DMEM_data_out;
      end

      2'b11: begin
        data_out_1 = WB_data;
      end
    endcase
  end

  always @(*) begin : proc_data_out_2
    data_out_2 = 0;
    case (forward_comp2)
      2'b00: begin
        data_out_2 = data_rs2;
      end

      2'b01: begin
        data_out_2 = alu_out;
      end

      2'b10: begin
        data_out_2 = DMEM_data_out;
      end

      2'b11: begin
        data_out_2 = WB_data;
      end
    endcase
  end

  //============================================
  //               Branch comparation
  //============================================

  branch_comp #(
    .REG_WIDTH(REG_WIDTH)
  ) branch_comp_inst (
      .br_un   (br_un       ),
      .data_rs1(data_out_1),
      .data_rs2(data_out_2),
      .br_eq   (br_eq       ),
      .br_lt   (br_lt       ) 
  );

endmodule