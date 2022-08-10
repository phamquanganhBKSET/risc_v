onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group RISCV /riscv_tb/riscv/clk
add wave -noupdate -group RISCV /riscv_tb/riscv/reset_n
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_imm
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_write
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_flush
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_write
add wave -noupdate -group RISCV /riscv_tb/riscv/pc
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_next
add wave -noupdate -group RISCV /riscv_tb/riscv/inst
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_pc
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_inst
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_inst_opcode
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_rs1
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_rs2
add wave -noupdate -group RISCV /riscv_tb/riscv/IF_ID_rd
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_rd
add wave -noupdate -group RISCV /riscv_tb/riscv/ctrl_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_rd
add wave -noupdate -group RISCV /riscv_tb/riscv/WB_data
add wave -noupdate -group RISCV /riscv_tb/riscv/alu_out
add wave -noupdate -group RISCV /riscv_tb/riscv/DMEM_data_out
add wave -noupdate -group RISCV /riscv_tb/riscv/data_out_1
add wave -noupdate -group RISCV /riscv_tb/riscv/data_out_2
add wave -noupdate -group RISCV /riscv_tb/riscv/imm_out
add wave -noupdate -group RISCV /riscv_tb/riscv/reg_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/alu_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/mem_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/ASel
add wave -noupdate -group RISCV /riscv_tb/riscv/BSel
add wave -noupdate -group RISCV /riscv_tb/riscv/wb_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/forward_comp1
add wave -noupdate -group RISCV /riscv_tb/riscv/forward_comp2
add wave -noupdate -group RISCV /riscv_tb/riscv/dataB
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_alu_out
add wave -noupdate -group RISCV /riscv_tb/riscv/forwardA
add wave -noupdate -group RISCV /riscv_tb/riscv/forwardB
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_dataB
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_inst_opcode
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_rs1
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_rs2
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_rd
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_reg_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_mem_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/EX_MEM_wb_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_inst_opcode
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_rs1
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_rs2
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_pc_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_data_out_1
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_data_out_2
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_imm_out
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_reg_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_alu_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_mem_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_ASel
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_BSel
add wave -noupdate -group RISCV /riscv_tb/riscv/ID_EX_wb_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_alu_out
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_dataB
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_inst_opcode
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_rs1
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_rs2
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_reg_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_reg_wb_sel
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/clk
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/reset_n
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/pc_imm
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/pc_sel
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/pc_write
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/IF_ID_write
add wave -noupdate -expand -group STAGE_IF -radix unsigned /riscv_tb/riscv/stage_IF/pc
add wave -noupdate -expand -group STAGE_IF -radix unsigned /riscv_tb/riscv/stage_IF/pc_next
add wave -noupdate -expand -group STAGE_IF -radix binary /riscv_tb/riscv/stage_IF/inst
add wave -noupdate -expand -group STAGE_IF -radix unsigned /riscv_tb/riscv/stage_IF/pre_pc
add wave -noupdate -expand -group REG_IF_ID /riscv_tb/riscv/reg_IF_ID/clk
add wave -noupdate -expand -group REG_IF_ID /riscv_tb/riscv/reg_IF_ID/reset_n
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/pc
add wave -noupdate -expand -group REG_IF_ID -radix binary /riscv_tb/riscv/reg_IF_ID/inst
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_pc
add wave -noupdate -expand -group REG_IF_ID -radix binary /riscv_tb/riscv/reg_IF_ID/IF_ID_inst
add wave -noupdate -expand -group REG_IF_ID /riscv_tb/riscv/reg_IF_ID/IF_ID_inst_opcode
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_rs1
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_rs2
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_rd
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/IF_ID_rs1
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/IF_ID_rs2
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/ID_EX_rd
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/ID_EX_mem_wr_en
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/ctrl_sel
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/pc_write
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/IF_ID_flush
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/IF_ID_write
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/IF_ID_pc
add wave -noupdate -expand -group {Stage ID} -radix binary /riscv_tb/riscv/stage_ID/IF_ID_inst
add wave -noupdate -expand -group {Stage ID} -radix unsigned /riscv_tb/riscv/stage_ID/IF_ID_rs1
add wave -noupdate -expand -group {Stage ID} -radix unsigned /riscv_tb/riscv/stage_ID/IF_ID_rs2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/MEM_WB_reg_wr_en
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/MEM_WB_rd
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/WB_data
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/forward_comp1
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/forward_comp2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/DMEM_data_out
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/pc_imm
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/pc_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/data_out_1
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/data_out_2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/imm_out
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/reg_write_en
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/alu_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/mem_write_en
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/ASel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/BSel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/wb_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/data_rs1
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/data_rs2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/imm_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/br_un
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/br_eq
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/br_lt
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/clk
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/reset_n
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/IF_ID_inst_opcode
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/IF_ID_rs1
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/IF_ID_rs2
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/IF_ID_rd
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/pc_sel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ctr_sel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/data_out_1
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/data_out_2
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/imm_out
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/reg_write_en
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/alu_sel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/mem_write_en
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ASel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/BSel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/wb_sel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_inst_opcode
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_rs1
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_rs2
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_rd
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_pc_sel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_data_out_1
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_data_out_2
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_imm_out
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_reg_write_en
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_alu_sel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_mem_write_en
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_ASel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_BSel
add wave -noupdate -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_wb_sel
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/clk
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/reset_n
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/forwardA
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/forwardB
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/ID_EX_data_out_1
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/ID_EX_data_out_2
add wave -noupdate -expand -group STAGE_EX -radix binary /riscv_tb/riscv/stage_EX/ID_EX_imm_out
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/WB_data
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/EX_MEM_alu_out
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/ID_EX_alu_sel
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/ID_EX_ASel
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/ID_EX_BSel
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/alu_out
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/dataB
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/dataA
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/clk
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/reset_n
add wave -noupdate -expand -group reg_EX_MEM -radix decimal /riscv_tb/riscv/reg_EX_MEM/alu_out
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/dataB
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_inst_opcode
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_rs1
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_rs2
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_rd
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_reg_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_mem_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_wb_sel
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_alu_out
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_dataB
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_inst_opcode
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_rs1
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_rs2
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_rd
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_reg_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_mem_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_wb_sel
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/clk
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/reset_n
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/EX_MEM_mem_write_en
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/EX_MEM_alu_out
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/EX_MEM_dataB
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/DMEM_data_out
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/clk
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/reset_n
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/DMEM_data_out
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_dataB
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_inst_opcode
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_rs1
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_rs2
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_rd
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_reg_write_en
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_wb_sel
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/EX_MEM_alu_out
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_alu_out
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_dataB
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_inst_opcode
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_rs1
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_rs2
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_rd
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_reg_write_en
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_reg_wb_sel
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/clk
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/reset_n
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/MEM_WB_reg_wb_sel
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/MEM_WB_alu_out
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/EX_MEM_alu_out
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/EX_MEM_reg_write_en
add wave -noupdate -group STAGE_WB /riscv_tb/riscv/stage_WB/WB_data
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/IF_ID_inst_opcode
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/IF_ID_rs1
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/IF_ID_rs2
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/ID_EX_reg_wr_en
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/ID_EX_rs1
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/ID_EX_rs2
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/ID_EX_rd
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/EX_MEM_reg_wr_en
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/EX_MEM_rd
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/MEM_WB_reg_wr_en
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/MEM_WB_rd
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/forwardA
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/forwardB
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/forward_comp1
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/forward_comp2
add wave -noupdate -group {Forward Unit} /riscv_tb/riscv/forwarding_unit/branch_inst
add wave -noupdate -expand -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/alu_sel
add wave -noupdate -expand -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/dataA
add wave -noupdate -expand -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/dataB
add wave -noupdate -expand -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 187
configure wave -valuecolwidth 129
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {20 ns} {60 ns}
