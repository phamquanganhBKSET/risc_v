`include "../inc/risc_v_defines.vh"

module riscv #(
  parameter REG_WIDTH       = `REG_WIDTH      ,
  parameter INST_WIDTH      = `INST_WIDTH     ,
  parameter IMM_SEL_WIDTH   = `IMM_SEL_WIDTH  ,
  parameter MEM_WIDTH       = `MEM_WIDTH      ,
  parameter DMEM_ADDR_WIDTH = `DMEM_ADDR_WIDTH,
  parameter REG_ADDR_WIDTH  = `REG_ADDR_WIDTH ,
  parameter PC_WIDTH        = `PC_WIDTH       ,
  parameter IMEM_DEPTH      = `IMEM_DEPTH     ,
  parameter NUM_REG         = `NUM_REG        ,
  parameter DMEM_DEPTH      = `DMEM_DEPTH      
)
(
	input clk    , // Clock
	input reset_n  // Asynchronous reset active low
);

wire  [PC_WIDTH-1:0      ]     pc_imm             ; // Program counter
wire                           pc_sel             ; // PC select
wire                           pc_write           ; // PC write
wire                           IF_flush           ; // IF flush
wire                           IF_ID_write        ; // IF/ID write
wire  [PC_WIDTH-1:0      ]     pc                 ; // PC register
wire  [PC_WIDTH-1:0      ]     pc_next            ; // PC next
wire  [INST_WIDTH-1:0    ]     inst               ; // Instruction
wire  [PC_WIDTH-1:0      ]     IF_ID_pc           ;
wire  [INST_WIDTH-1:0    ]     IF_ID_inst         ;
wire  [6:0               ]     IF_ID_inst_opcode  ;
wire  [REG_ADDR_WIDTH-1:0]     IF_ID_rs1          ;
wire  [REG_ADDR_WIDTH-1:0]     IF_ID_rs2          ;
wire  [REG_ADDR_WIDTH-1:0]     IF_ID_rd           ;

wire  [REG_ADDR_WIDTH-1:0]     ID_EX_rd           ; // ID/EX.RegisterRd
wire                           ctrl_sel           ; // Control select

wire  [REG_ADDR_WIDTH-1:0]     MEM_WB_rd          ; // MEM/WB.RegisterRd
wire  [REG_WIDTH-1:0     ]     WB_data            ; // WB data
wire  [REG_WIDTH-1:0     ]     alu_out            ; // ALU out
wire  [REG_WIDTH-1:0     ]     DMEM_data_out      ; // DMEM data out
wire  [REG_WIDTH-1:0     ]     data_out_1         ; // Data out rs1
wire  [REG_WIDTH-1:0     ]     data_out_2         ; // Data out rs2
wire  [REG_WIDTH-1:0     ]     imm_out            ; // Immediate out
wire                           reg_write_en       ; // Reg write enable
wire  [2:0               ]     alu_sel            ; // ALU select
wire                           mem_write_en       ; // MEM write enable
wire                           ASel               ; // A select
wire                           BSel               ; // B select
wire                           wb_sel             ; // WB select
wire [1:0                ]     forward_comp1      ; // Forward comp 1
wire [1:0                ]     forward_comp2      ; // Forward comp 2
wire [REG_WIDTH-1:0      ]     dataB              ; // Data B
wire [REG_WIDTH-1:0      ]     EX_MEM_alu_out     ; // EX/MEM ALU out
wire [1:0                ]     forwardA           ; // Forward A
wire [1:0                ]     forwardB           ; // Forward B
wire [REG_WIDTH-1:0      ]     EX_MEM_dataB       ; // Data B
wire [6:0                ]     EX_MEM_inst_opcode ; // IF/ID instruction opcode
wire [REG_ADDR_WIDTH-1:0 ]     EX_MEM_rs1         ; // IF/ID.RegisterRs1
wire [REG_ADDR_WIDTH-1:0 ]     EX_MEM_rs2         ; // IF/ID.RegisterRs2
wire [REG_ADDR_WIDTH-1:0 ]     EX_MEM_rd          ; // IF/ID.RegisterRd
wire                           EX_MEM_reg_write_en; // ID/EX Reg write enable
wire                           EX_MEM_mem_write_en; // ID/EX MEM write enable
wire                           EX_MEM_wb_sel      ; 
wire [6:0                ]     ID_EX_inst_opcode  ; // IF/ID instruction opcode
wire [REG_ADDR_WIDTH-1:0 ]     ID_EX_rs1          ; // IF/ID.RegisterRs1
wire [REG_ADDR_WIDTH-1:0 ]     ID_EX_rs2          ; // IF/ID.RegisterRs2
wire                           ID_EX_pc_sel       ; // ID/EX PC select
wire [REG_WIDTH-1:0      ]     ID_EX_data_out_1   ; // ID/EX Data rs1
wire [REG_WIDTH-1:0      ]     ID_EX_data_out_2   ; // ID/EX Data rs2
wire [REG_WIDTH-1:0      ]     ID_EX_imm_out      ; // ID/EX Immediate out
wire                           ID_EX_reg_write_en ; // ID/EX Reg write enable
wire [2:0                ]     ID_EX_alu_sel      ; // ID/EX ALU select
wire                           ID_EX_mem_write_en ; // ID/EX MEM write enable
wire                           ID_EX_ASel         ; // A select
wire                           ID_EX_BSel         ; // B select
wire                           ID_EX_wb_sel       ;
wire [REG_WIDTH-1:0     ]      MEM_WB_alu_out     ; // ALU out
wire [REG_WIDTH-1:0     ]      MEM_WB_data_out    ; // DMEM data out
wire [REG_WIDTH-1:0     ]      MEM_WB_dataB       ; // Data B
wire [6:0               ]      MEM_WB_inst_opcode ; // IF/ID instruction opcode
wire [REG_ADDR_WIDTH-1:0]      MEM_WB_rs1         ; // IF/ID.RegisterRs1
wire [REG_ADDR_WIDTH-1:0]      MEM_WB_rs2         ; // IF/ID.RegisterRs2
wire                           MEM_WB_reg_write_en; // ID/EX Reg write enable
wire                           MEM_WB_reg_wb_sel  ;
wire [PC_WIDTH-1:0      ]      IF_ID_pc_next      ; // PC next
wire [PC_WIDTH-1:0      ]      ID_EX_pc_next      ; // PC_next

stage_IF #(
  .MEM_WIDTH  (MEM_WIDTH  ),
  .PC_WIDTH   (PC_WIDTH   ),
  .INST_WIDTH (INST_WIDTH )
) stage_IF(
  .clk        (clk        ),
  .reset_n    (reset_n    ),
  .pc_imm     (pc_imm     ),
  .pc_sel     (pc_sel     ),
  .pc_write   (pc_write   ),
  .IF_ID_write(IF_ID_write),
  .pc         (pc         ),
  .pc_next    (pc_next    ),
  .inst       (inst       )
);

reg_IF_ID #(
  .PC_WIDTH      (PC_WIDTH       ),
  .INST_WIDTH    (INST_WIDTH     ),
  .REG_ADDR_WIDTH(REG_ADDR_WIDTH )
) reg_IF_ID (
  .clk              (clk              ), // Clock signal
  .reset_n          (reset_n          ), // Asynchronous reset
  .IF_flush         (IF_flush         ),
  .IF_ID_write      (IF_ID_write      ),
  .pc               (pc               ), // PC
  .pc_next          (pc_next          ), // PC
  .inst             (inst             ), // Instruction
  .IF_ID_pc         (IF_ID_pc         ), // IF_ID_PC
  .IF_ID_inst       (IF_ID_inst       ), // IF_ID_inst
  .IF_ID_pc_next    (IF_ID_pc_next    ), // IF/ID PC_next
  .IF_ID_inst_opcode(IF_ID_inst_opcode), // IF/ID instruction opcode
  .IF_ID_rs1        (IF_ID_rs1        ), // IF/ID.RegisterRs1
  .IF_ID_rs2        (IF_ID_rs2        ), // IF/ID.RegisterRs2
  .IF_ID_rd         (IF_ID_rd         )  // IF/ID.RegisterRd
);

hazard_detection #(
  .REG_ADDR_WIDTH (REG_ADDR_WIDTH)
) hazard_detection (
  .ID_EX_inst_opcode(ID_EX_inst_opcode ), // IF/ID Instruction opcode
  .IF_ID_rs1        (IF_ID_rs1         ), // IF/ID.RegisterRs1
  .IF_ID_rs2        (IF_ID_rs2         ), // IF/ID.RegisterRs2
  .ID_EX_rd         (ID_EX_rd          ), // ID/EX.RegisterRd
  .ID_EX_mem_wr_en  (ID_EX_mem_write_en), // ID/EX Mem write enable
  .ctrl_sel         (ctrl_sel          ), // Control select
  .pc_write         (pc_write          ), // PC Write
  .IF_ID_write      (IF_ID_write       )  // IF/ID Write
);


stage_ID #(
  .NUM_REG       (NUM_REG       ),
  .REG_ADDR_WIDTH(REG_ADDR_WIDTH),
  .REG_WIDTH     (REG_WIDTH     ),
  .PC_WIDTH      (PC_WIDTH      ),
  .INST_WIDTH    (INST_WIDTH    ),
  .IMM_SEL_WIDTH (IMM_SEL_WIDTH ) 
) stage_ID (
  .clk             (clk                ), // Clock signal
  .reset_n         (reset_n            ), // Asynchronous reset
  .IF_ID_pc        (IF_ID_pc           ), // IF/ID PC
  .IF_ID_inst      (IF_ID_inst         ), // ID/ID instruction
  .IF_ID_rs1       (IF_ID_rs1          ), // IF/ID.RegisterRs1
  .IF_ID_rs2       (IF_ID_rs2          ), // IF/ID.RegisterRs2
  .MEM_WB_reg_wr_en(MEM_WB_reg_write_en), // MEM/WB RegWrite
  .MEM_WB_rd       (MEM_WB_rd          ), // MEM/WB.RegisterRd
  .WB_data         (WB_data            ), // WB data
  .forward_comp1   (forward_comp1      ), // Forward compare 1
  .forward_comp2   (forward_comp2      ), // Forward compare 2
  .alu_out         (alu_out            ), // ALU out
  .DMEM_data_out   (DMEM_data_out      ), // DMEM data out
  .pc_imm          (pc_imm             ), // PC immediate
  .pc_sel          (pc_sel             ), // PC select
  .data_out_1      (data_out_1         ), // Data out rs1
  .data_out_2      (data_out_2         ), // Data out rs2
  .imm_out         (imm_out            ), // Immediate out
  .reg_write_en    (reg_write_en       ), // Reg write enable
  .alu_sel         (alu_sel            ), // ALU select
  .mem_write_en    (mem_write_en       ), // MEM write enable
  .ASel            (ASel               ), // A select
  .BSel            (BSel               ), // B select
  .wb_sel          (wb_sel             ), // WB select
  .IF_flush        (IF_flush           )  // IF flush
);

reg_ID_EX #(
  .REG_WIDTH     (REG_WIDTH     ),
  .REG_ADDR_WIDTH(REG_ADDR_WIDTH)
) reg_ID_EX (
  .clk               (clk               ), // Clock signal
  .reset_n           (reset_n           ), // Asynchronous reset
  .IF_ID_inst_opcode (IF_ID_inst_opcode ), // IF/ID instruction opcode
  .IF_ID_rs1         (IF_ID_rs1         ), // IF/ID.RegisterRs1
  .IF_ID_rs2         (IF_ID_rs2         ), // IF/ID.RegisterRs2
  .IF_ID_rd          (IF_ID_rd          ), // IF/ID.RegisterRd
  .IF_ID_pc_next     (IF_ID_pc_next     ), // IF/ID PC_next
  .pc_sel            (pc_sel            ), // PC select
  .ctr_sel           (ctrl_sel          ), // Control select
  .data_out_1        (data_out_1        ), // Data out rs1
  .data_out_2        (data_out_2        ), // Data out rs2
  .imm_out           (imm_out           ), // Immediate out
  .reg_write_en      (reg_write_en      ), // Reg write enable
  .alu_sel           (alu_sel           ), // ALU select
  .mem_write_en      (mem_write_en      ), // MEM write enable
  .ASel              (ASel              ), // A select
  .BSel              (BSel              ), // B select
  .wb_sel            (wb_sel            ), // WB select
  .ID_EX_inst_opcode (ID_EX_inst_opcode ), // IF/ID instruction opcode
  .ID_EX_rs1         (ID_EX_rs1         ), // IF/ID.RegisterRs1
  .ID_EX_rs2         (ID_EX_rs2         ), // IF/ID.RegisterRs2
  .ID_EX_rd          (ID_EX_rd          ), // IF/ID.RegisterRd
  .ID_EX_pc_sel      (ID_EX_pc_sel      ), // ID/EX PC select
  .ID_EX_data_out_1  (ID_EX_data_out_1  ), // ID/EX Data rs1
  .ID_EX_data_out_2  (ID_EX_data_out_2  ), // ID/EX Data rs2
  .ID_EX_imm_out     (ID_EX_imm_out     ), // ID/EX Immediate out
  .ID_EX_reg_write_en(ID_EX_reg_write_en), // ID/EX Reg write enable
  .ID_EX_alu_sel     (ID_EX_alu_sel     ), // ID/EX ALU select
  .ID_EX_mem_write_en(ID_EX_mem_write_en), // ID/EX MEM write enable
  .ID_EX_ASel        (ID_EX_ASel        ), // A select
  .ID_EX_BSel        (ID_EX_BSel        ), // B select
  .ID_EX_pc_next     (ID_EX_pc_next     ), // PC next
  .ID_EX_wb_sel      (ID_EX_wb_sel      )  // ID/EX WB select
);

stage_EX #(
  .REG_WIDTH(REG_WIDTH)
) stage_EX (
  .clk             (clk             ), // Clock signal
  .reset_n         (reset_n         ), // Asynchronous reset
  .forwardA        (forwardA        ), // Forward A
  .forwardB        (forwardB        ), // Forward B
  .ID_EX_data_out_1(ID_EX_data_out_1), // ID/EX Data rs1
  .ID_EX_data_out_2(ID_EX_data_out_2), // ID/EX Data rs2
  .ID_EX_imm_out   (ID_EX_imm_out   ), // ID/EX Immediate out
  .WB_data         (WB_data         ), // WB data
  .EX_MEM_alu_out  (EX_MEM_alu_out  ), // EX/MEM ALU out
  .ID_EX_alu_sel   (ID_EX_alu_sel   ), // ID/EX ALU select
  .ID_EX_ASel      (ID_EX_ASel      ), // A select
  .ID_EX_BSel      (ID_EX_BSel      ), // B select
  .alu_out         (alu_out         ), // ALU out
  .dataB           (dataB           )  // Data B
);

reg_EX_MEM #(
  .REG_WIDTH      (REG_WIDTH     ),
  .REG_ADDR_WIDTH (REG_ADDR_WIDTH) 
) reg_EX_MEM (
  .clk                (clk                ), // Clock signal
  .reset_n            (reset_n            ), // Asynchronous reset
  .alu_out            (alu_out            ), // ALU out
  .dataB              (dataB              ), // Data B
  .ID_EX_inst_opcode  (ID_EX_inst_opcode  ), // IF/ID instruction opcode
  .ID_EX_pc_next      (ID_EX_pc_next      ), // PC next
  .ID_EX_rs1          (ID_EX_rs1          ), // IF/ID.RegisterRs1
  .ID_EX_rs2          (ID_EX_rs2          ), // IF/ID.RegisterRs2
  .ID_EX_rd           (ID_EX_rd           ), // IF/ID.RegisterRd
  .ID_EX_reg_write_en (ID_EX_reg_write_en ), // ID/EX Reg write enable
  .ID_EX_mem_write_en (ID_EX_mem_write_en ), // ID/EX MEM write enable
  .ID_EX_wb_sel       (ID_EX_wb_sel       ), // ID/EX WB select
  .EX_MEM_alu_out     (EX_MEM_alu_out     ), // ALU out
  .EX_MEM_dataB       (EX_MEM_dataB       ), // Data B
  .EX_MEM_inst_opcode (EX_MEM_inst_opcode ), // IF/ID instruction opcode
  .EX_MEM_rs1         (EX_MEM_rs1         ), // IF/ID.RegisterRs1
  .EX_MEM_rs2         (EX_MEM_rs2         ), // IF/ID.RegisterRs2
  .EX_MEM_rd          (EX_MEM_rd          ), // IF/ID.RegisterRd
  .EX_MEM_reg_write_en(EX_MEM_reg_write_en), // ID/EX Reg write enable
  .EX_MEM_mem_write_en(EX_MEM_mem_write_en), // ID/EX MEM write enable
  .EX_MEM_wb_sel      (EX_MEM_wb_sel      )  // ID/EX WB select
);

stage_MEM  #(
  .MEM_WIDTH      (MEM_WIDTH      ),
  .DMEM_ADDR_WIDTH(DMEM_ADDR_WIDTH),
  .REG_WIDTH      (REG_WIDTH      ),
  .DMEM_DEPTH     (DMEM_DEPTH     )
) stage_MEM (
  .clk                (clk                ), // Clock
  .reset_n            (reset_n            ), // Asynchronous reset active low
  .EX_MEM_mem_write_en(EX_MEM_mem_write_en), // ID/EX MEM write enable
  .EX_MEM_inst_opcode (EX_MEM_inst_opcode ), // EX/MEM opcode
  .EX_MEM_alu_out     (EX_MEM_alu_out     ), // ALU out
  .EX_MEM_dataB       (EX_MEM_dataB       ), // Data B
  .DMEM_data_out      (DMEM_data_out      )  // ALU out
);

reg_MEM_WB #(
  .REG_WIDTH     (REG_WIDTH     ),
  .REG_ADDR_WIDTH(REG_ADDR_WIDTH) 
) reg_MEM_WB (
  .clk                (clk                ), // Clock signal
  .reset_n            (reset_n            ), // Asynchronous reset
  .DMEM_data_out      (DMEM_data_out      ), // ALU out
  .EX_MEM_dataB       (EX_MEM_dataB       ), // Data B
  .EX_MEM_inst_opcode (EX_MEM_inst_opcode ), // IF/ID instruction opcode
  .EX_MEM_rs1         (EX_MEM_rs1         ), // IF/ID.RegisterRs1
  .EX_MEM_rs2         (EX_MEM_rs2         ), // IF/ID.RegisterRs2
  .EX_MEM_rd          (EX_MEM_rd          ), // IF/ID.RegisterRd
  .EX_MEM_reg_write_en(EX_MEM_reg_write_en), // ID/EX Reg write enable
  .EX_MEM_wb_sel      (EX_MEM_wb_sel      ), // ID/EX WB select
  .EX_MEM_alu_out     (EX_MEM_alu_out     ),
  .MEM_WB_alu_out     (MEM_WB_alu_out     ), // ALU out
  .MEM_WB_data_out    (MEM_WB_data_out    ), // DMEM data out
  .MEM_WB_dataB       (MEM_WB_dataB       ), // Data B
  .MEM_WB_inst_opcode (MEM_WB_inst_opcode ), // IF/ID instruction opcode
  .MEM_WB_rs1         (MEM_WB_rs1         ), // IF/ID.RegisterRs1
  .MEM_WB_rs2         (MEM_WB_rs2         ), // IF/ID.RegisterRs2
  .MEM_WB_rd          (MEM_WB_rd          ), // IF/ID.RegisterRd
  .MEM_WB_reg_write_en(MEM_WB_reg_write_en),  // ID/EX Reg write enable
  .MEM_WB_reg_wb_sel  (MEM_WB_reg_wb_sel  )  
);

stage_WB #(
  .REG_WIDTH(REG_WIDTH)
) stage_WB(
  .clk                (clk                ),  // Clock
  .reset_n            (reset_n            ),  // Asynchronous reset active low
  .MEM_WB_reg_wb_sel  (MEM_WB_reg_wb_sel  ),   
  .MEM_WB_alu_out     (MEM_WB_alu_out     ),  // ALU out
  .MEM_WB_data_out    (MEM_WB_data_out    ),  // DMEM data out
  .WB_data            (WB_data            )   // wb_data to register file
);

forwarding_unit #(
  .REG_ADDR_WIDTH(REG_ADDR_WIDTH)
) forwarding_unit (
  .IF_ID_inst_opcode (IF_ID_inst_opcode     ), // IF/ID opcode
  .IF_ID_rs1         (IF_ID_rs1             ), // IF/ID.RegisterRs1
  .IF_ID_rs2         (IF_ID_rs2             ), // IF/ID.RegisterRs2
  .ID_EX_reg_wr_en   (ID_EX_reg_write_en    ), // ID/EX Reg write enable
  .ID_EX_rs1         (ID_EX_rs1             ), // ID/EX.RegisterRs1
  .ID_EX_rs2         (ID_EX_rs2             ), // ID/EX.RegisterRs2
  .ID_EX_rd          (ID_EX_rd              ), // ID/EX.RegisterRd
  .EX_MEM_reg_wr_en  (EX_MEM_reg_write_en   ), // EX/MEM Reg write enable
  .EX_MEM_rd         (EX_MEM_rd             ), // EX/MEM.RegisterRd
  .MEM_WB_reg_wr_en  (MEM_WB_reg_write_en   ), // MEM/WB Reg write enable
  .MEM_WB_rd         (MEM_WB_rd             ), // MEM/WB.RegisterRd
  .forwardA          (forwardA              ), // Forwarding A
  .forwardB          (forwardB              ), // Forwarding B
  .forward_comp1     (forward_comp1         ), // Forwarding compare 1
  .forward_comp2     (forward_comp2         )  // Forwarding compare 2
);


endmodule : riscv