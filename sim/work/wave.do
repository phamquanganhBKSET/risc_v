onerror {resume}
quietly virtual function -install /riscv_tb/riscv/stage_MEM/DMEM -env /riscv_tb/#ALWAYS#36 { &{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0], /riscv_tb/riscv/stage_MEM/DMEM/dmem[1], /riscv_tb/riscv/stage_MEM/DMEM/dmem[2], /riscv_tb/riscv/stage_MEM/DMEM/dmem[3] }} arr0
quietly virtual function -install /riscv_tb/riscv/stage_MEM/DMEM -env /riscv_tb/#ALWAYS#36 { &{/riscv_tb/riscv/stage_MEM/DMEM/dmem[4], /riscv_tb/riscv/stage_MEM/DMEM/dmem[5], /riscv_tb/riscv/stage_MEM/DMEM/dmem[6], /riscv_tb/riscv/stage_MEM/DMEM/dmem[7] }} arr1
quietly WaveActivateNextPane {} 0
add wave -noupdate -group RISCV /riscv_tb/riscv/clk
add wave -noupdate -group RISCV /riscv_tb/riscv/reset_n
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_imm
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_sel
add wave -noupdate -group RISCV /riscv_tb/riscv/pc_write
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
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_dataB
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_inst_opcode
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_rs1
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_rs2
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_reg_write_en
add wave -noupdate -group RISCV /riscv_tb/riscv/MEM_WB_reg_wb_sel
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/clk
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/reset_n
add wave -noupdate -expand -group STAGE_IF -radix decimal /riscv_tb/riscv/stage_IF/pc_imm
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/pc_sel
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/pc_write
add wave -noupdate -expand -group STAGE_IF /riscv_tb/riscv/stage_IF/IF_ID_write
add wave -noupdate -expand -group STAGE_IF -radix decimal /riscv_tb/riscv/stage_IF/pc
add wave -noupdate -expand -group STAGE_IF -radix decimal /riscv_tb/riscv/stage_IF/pc_next
add wave -noupdate -expand -group STAGE_IF -radix binary /riscv_tb/riscv/stage_IF/inst
add wave -noupdate -expand -group STAGE_IF -radix decimal -childformat {{{/riscv_tb/riscv/stage_IF/pre_pc[31]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[30]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[29]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[28]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[27]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[26]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[25]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[24]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[23]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[22]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[21]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[20]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[19]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[18]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[17]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[16]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[15]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[14]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[13]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[12]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[11]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[10]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[9]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[8]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[7]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[6]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[5]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[4]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[3]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[2]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[1]} -radix unsigned} {{/riscv_tb/riscv/stage_IF/pre_pc[0]} -radix unsigned}} -subitemconfig {{/riscv_tb/riscv/stage_IF/pre_pc[31]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[30]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[29]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[28]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[27]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[26]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[25]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[24]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[23]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[22]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[21]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[20]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[19]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[18]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[17]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[16]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[15]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[14]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[13]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[12]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[11]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[10]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[9]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[8]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[7]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[6]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[5]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[4]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[3]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[2]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[1]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_IF/pre_pc[0]} {-height 15 -radix unsigned}} /riscv_tb/riscv/stage_IF/pre_pc
add wave -noupdate -expand -group REG_IF_ID /riscv_tb/riscv/reg_IF_ID/clk
add wave -noupdate -expand -group REG_IF_ID /riscv_tb/riscv/reg_IF_ID/reset_n
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/pc
add wave -noupdate -expand -group REG_IF_ID -radix binary -childformat {{{/riscv_tb/riscv/reg_IF_ID/inst[31]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[30]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[29]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[28]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[27]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[26]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[25]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[24]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[23]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[22]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[21]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[20]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[19]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[18]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[17]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[16]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[15]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[14]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[13]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[12]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[11]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[10]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[9]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[8]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[7]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[6]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[5]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[4]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[3]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[2]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[1]} -radix binary} {{/riscv_tb/riscv/reg_IF_ID/inst[0]} -radix binary}} -subitemconfig {{/riscv_tb/riscv/reg_IF_ID/inst[31]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[30]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[29]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[28]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[27]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[26]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[25]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[24]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[23]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[22]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[21]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[20]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[19]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[18]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[17]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[16]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[15]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[14]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[13]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[12]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[11]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[10]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[9]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[8]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[7]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[6]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[5]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[4]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[3]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[2]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[1]} {-height 15 -radix binary} {/riscv_tb/riscv/reg_IF_ID/inst[0]} {-height 15 -radix binary}} /riscv_tb/riscv/reg_IF_ID/inst
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_pc
add wave -noupdate -expand -group REG_IF_ID -radix binary /riscv_tb/riscv/reg_IF_ID/IF_ID_inst
add wave -noupdate -expand -group REG_IF_ID /riscv_tb/riscv/reg_IF_ID/IF_ID_inst_opcode
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_rs1
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_rs2
add wave -noupdate -expand -group REG_IF_ID -radix unsigned /riscv_tb/riscv/reg_IF_ID/IF_ID_rd
add wave -noupdate -group {Hazard detection} -radix unsigned /riscv_tb/riscv/hazard_detection/IF_ID_rs1
add wave -noupdate -group {Hazard detection} -radix unsigned /riscv_tb/riscv/hazard_detection/IF_ID_rs2
add wave -noupdate -group {Hazard detection} -radix unsigned /riscv_tb/riscv/hazard_detection/ID_EX_rd
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/ID_EX_inst_opcode
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/ID_EX_mem_wr_en
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/ctrl_sel
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/pc_write
add wave -noupdate -group {Hazard detection} /riscv_tb/riscv/hazard_detection/IF_ID_write
add wave -noupdate -expand -group {Stage ID} -radix unsigned /riscv_tb/riscv/stage_ID/IF_ID_pc
add wave -noupdate -expand -group {Stage ID} -radix binary /riscv_tb/riscv/stage_ID/IF_ID_inst
add wave -noupdate -expand -group {Stage ID} -radix unsigned /riscv_tb/riscv/stage_ID/IF_ID_rs1
add wave -noupdate -expand -group {Stage ID} -radix unsigned /riscv_tb/riscv/stage_ID/IF_ID_rs2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/MEM_WB_reg_wr_en
add wave -noupdate -expand -group {Stage ID} -radix unsigned /riscv_tb/riscv/stage_ID/MEM_WB_rd
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/WB_data
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/forward_comp1
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/forward_comp2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/DMEM_data_out
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/pc_imm
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/pc_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/forwarding_unit/branch_inst
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/data_out_1
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/data_out_2
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/imm_out
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/reg_write_en
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/alu_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/mem_write_en
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/ASel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/BSel
add wave -noupdate -expand -group {Stage ID} -color Yellow /riscv_tb/riscv/stage_ID/wb_sel
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/data_rs1
add wave -noupdate -expand -group {Stage ID} -radix decimal /riscv_tb/riscv/stage_ID/data_rs2
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/imm_sel
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/IF_flush
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/br_un
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/br_eq
add wave -noupdate -expand -group {Stage ID} /riscv_tb/riscv/stage_ID/br_lt
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/clk
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/reset_n
add wave -noupdate -expand -group reg_ID_EX -radix binary /riscv_tb/riscv/reg_ID_EX/IF_ID_inst_opcode
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/IF_ID_rs1
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/IF_ID_rs2
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/IF_ID_rd
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/pc_sel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ctr_sel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/data_out_1
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/data_out_2
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/imm_out
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/reg_write_en
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/alu_sel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/mem_write_en
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ASel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/BSel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/wb_sel
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/ID_EX_inst_opcode
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/ID_EX_rs1
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/ID_EX_rs2
add wave -noupdate -expand -group reg_ID_EX -radix unsigned /riscv_tb/riscv/reg_ID_EX/ID_EX_rd
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_pc_sel
add wave -noupdate -expand -group reg_ID_EX -radix decimal /riscv_tb/riscv/reg_ID_EX/ID_EX_data_out_1
add wave -noupdate -expand -group reg_ID_EX -radix decimal /riscv_tb/riscv/reg_ID_EX/ID_EX_data_out_2
add wave -noupdate -expand -group reg_ID_EX -radix decimal /riscv_tb/riscv/reg_ID_EX/ID_EX_imm_out
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_reg_write_en
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_alu_sel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_mem_write_en
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_ASel
add wave -noupdate -expand -group reg_ID_EX /riscv_tb/riscv/reg_ID_EX/ID_EX_BSel
add wave -noupdate -expand -group reg_ID_EX -color Yellow /riscv_tb/riscv/reg_ID_EX/ID_EX_wb_sel
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/clk
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/reset_n
add wave -noupdate -expand -group STAGE_EX -color Cyan /riscv_tb/riscv/stage_EX/forwardA
add wave -noupdate -expand -group STAGE_EX -color Cyan /riscv_tb/riscv/stage_EX/forwardB
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/ID_EX_data_out_1
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/ID_EX_data_out_2
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/ID_EX_imm_out
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/WB_data
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/EX_MEM_alu_out
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/ID_EX_alu_sel
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/ID_EX_ASel
add wave -noupdate -expand -group STAGE_EX /riscv_tb/riscv/stage_EX/ID_EX_BSel
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/dataA
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/dataB
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/alu_in_B
add wave -noupdate -expand -group STAGE_EX -radix decimal /riscv_tb/riscv/stage_EX/alu_out
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/clk
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/reset_n
add wave -noupdate -expand -group reg_EX_MEM -radix decimal /riscv_tb/riscv/reg_EX_MEM/alu_out
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/dataB
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_inst_opcode
add wave -noupdate -expand -group reg_EX_MEM -radix unsigned /riscv_tb/riscv/reg_EX_MEM/ID_EX_rs1
add wave -noupdate -expand -group reg_EX_MEM -radix unsigned /riscv_tb/riscv/reg_EX_MEM/ID_EX_rs2
add wave -noupdate -expand -group reg_EX_MEM -radix unsigned /riscv_tb/riscv/reg_EX_MEM/ID_EX_rd
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_reg_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_mem_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/ID_EX_wb_sel
add wave -noupdate -expand -group reg_EX_MEM -radix decimal /riscv_tb/riscv/reg_EX_MEM/EX_MEM_alu_out
add wave -noupdate -expand -group reg_EX_MEM -radix decimal /riscv_tb/riscv/reg_EX_MEM/EX_MEM_dataB
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_inst_opcode
add wave -noupdate -expand -group reg_EX_MEM -radix unsigned /riscv_tb/riscv/reg_EX_MEM/EX_MEM_rs1
add wave -noupdate -expand -group reg_EX_MEM -radix unsigned /riscv_tb/riscv/reg_EX_MEM/EX_MEM_rs2
add wave -noupdate -expand -group reg_EX_MEM -radix unsigned /riscv_tb/riscv/reg_EX_MEM/EX_MEM_rd
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_reg_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_mem_write_en
add wave -noupdate -expand -group reg_EX_MEM /riscv_tb/riscv/reg_EX_MEM/EX_MEM_wb_sel
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/clk
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/reset_n
add wave -noupdate -group {Stage MEM} /riscv_tb/riscv/stage_MEM/EX_MEM_mem_write_en
add wave -noupdate -group {Stage MEM} -radix decimal /riscv_tb/riscv/stage_MEM/EX_MEM_alu_out
add wave -noupdate -group {Stage MEM} -radix decimal /riscv_tb/riscv/stage_MEM/EX_MEM_dataB
add wave -noupdate -group {Stage MEM} -radix hexadecimal -childformat {{{/riscv_tb/riscv/stage_MEM/DMEM_data_out[31]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[30]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[29]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[28]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[27]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[26]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[25]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[24]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[23]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[22]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[21]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[20]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[19]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[18]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[17]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[16]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[15]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[14]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[13]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[12]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[11]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[10]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[9]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[8]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[7]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[6]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[5]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[4]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[3]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[2]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[1]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[0]} -radix decimal}} -subitemconfig {{/riscv_tb/riscv/stage_MEM/DMEM_data_out[31]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[30]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[29]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[28]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[27]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[26]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[25]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[24]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[23]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[22]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[21]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[20]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[19]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[18]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[17]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[16]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[15]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[14]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[13]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[12]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[11]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[10]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[9]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[8]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[7]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[6]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[5]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[4]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[3]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[2]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[1]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM_data_out[0]} {-height 15 -radix decimal}} /riscv_tb/riscv/stage_MEM/DMEM_data_out
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
add wave -noupdate -group REG_MEM_WB -radix decimal /riscv_tb/riscv/reg_MEM_WB/EX_MEM_alu_out
add wave -noupdate -group REG_MEM_WB -radix decimal /riscv_tb/riscv/reg_MEM_WB/MEM_WB_alu_out
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/stage_WB/MEM_WB_data_out
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_dataB
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_inst_opcode
add wave -noupdate -group REG_MEM_WB -radix unsigned /riscv_tb/riscv/reg_MEM_WB/MEM_WB_rs1
add wave -noupdate -group REG_MEM_WB -radix unsigned /riscv_tb/riscv/reg_MEM_WB/MEM_WB_rs2
add wave -noupdate -group REG_MEM_WB -radix unsigned /riscv_tb/riscv/reg_MEM_WB/MEM_WB_rd
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_reg_write_en
add wave -noupdate -group REG_MEM_WB /riscv_tb/riscv/reg_MEM_WB/MEM_WB_reg_wb_sel
add wave -noupdate -expand -group STAGE_WB /riscv_tb/riscv/stage_WB/clk
add wave -noupdate -expand -group STAGE_WB /riscv_tb/riscv/stage_WB/reset_n
add wave -noupdate -expand -group STAGE_WB -radix decimal /riscv_tb/riscv/stage_WB/MEM_WB_alu_out
add wave -noupdate -expand -group STAGE_WB -radix hexadecimal /riscv_tb/riscv/stage_WB/MEM_WB_data_out
add wave -noupdate -expand -group STAGE_WB -radix decimal /riscv_tb/riscv/stage_WB/MEM_WB_reg_wb_sel
add wave -noupdate -expand -group STAGE_WB -radix decimal /riscv_tb/riscv/stage_WB/WB_data
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
add wave -noupdate -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/alu_sel
add wave -noupdate -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/dataA
add wave -noupdate -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/dataB
add wave -noupdate -group ALU -radix decimal /riscv_tb/riscv/stage_EX/alu_inst/alu_out
add wave -noupdate /riscv_tb/riscv/stage_WB/clk
add wave -noupdate -childformat {{{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[0]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[1]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[2]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[3]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[4]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[5]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[6]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[7]} -radix unsigned} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[8]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[9]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[10]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[11]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[12]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[13]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[14]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[15]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[16]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[17]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[18]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[19]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[20]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[21]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[22]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[23]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[24]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[25]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[26]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[27]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[28]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[29]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[30]} -radix decimal} {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[31]} -radix decimal}} -expand -subitemconfig {{/riscv_tb/riscv/stage_ID/reg_file_inst/regs[0]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[1]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[2]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[3]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[4]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[5]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[6]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[7]} {-height 15 -radix unsigned} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[8]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[9]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[10]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[11]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[12]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[13]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[14]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[15]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[16]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[17]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[18]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[19]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[20]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[21]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[22]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[23]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[24]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[25]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[26]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[27]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[28]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[29]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[30]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_ID/reg_file_inst/regs[31]} {-height 15 -radix decimal}} /riscv_tb/riscv/stage_ID/reg_file_inst/regs
add wave -noupdate /riscv_tb/riscv/stage_WB/clk
add wave -noupdate -radix decimal -childformat {{{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0]} -radix decimal -childformat {{{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][7]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][6]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][5]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][4]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][3]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][2]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][1]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][0]} -radix decimal}}} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[1]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[2]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[3]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[4]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[5]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[6]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[7]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[8]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[9]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[10]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[11]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[12]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[13]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[14]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[15]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[16]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[17]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[18]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[19]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[20]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[21]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[22]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[23]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[24]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[25]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[26]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[27]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[28]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[29]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[30]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[31]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[32]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[33]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[34]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[35]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[36]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[37]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[38]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[39]} -radix decimal}} -expand -subitemconfig {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0]} {-height 15 -radix decimal -childformat {{{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][7]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][6]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][5]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][4]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][3]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][2]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][1]} -radix decimal} {{/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][0]} -radix decimal}}} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][7]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][6]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][5]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][4]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][3]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][2]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][1]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[0][0]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[1]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[2]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[3]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[4]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[5]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[6]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[7]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[8]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[9]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[10]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[11]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[12]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[13]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[14]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[15]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[16]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[17]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[18]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[19]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[20]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[21]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[22]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[23]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[24]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[25]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[26]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[27]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[28]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[29]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[30]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[31]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[32]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[33]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[34]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[35]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[36]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[37]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[38]} {-height 15 -radix decimal} {/riscv_tb/riscv/stage_MEM/DMEM/dmem[39]} {-height 15 -radix decimal}} /riscv_tb/riscv/stage_MEM/DMEM/dmem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{addi x4, x0, 0} {95 ns} 1} {{addi x7, x0, 3} {115 ns} 1} {{beq x8, x9, next} {155 ns} 1} {{lw x11, 0(x10)} {195 ns} 1} {{blt x13, x11, swap} {225 ns} 1} {{Cursor 12} {240 ns} 1} {{Cursor 13} {225 ns} 0}
quietly wave cursor active 7
configure wave -namecolwidth 182
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
WaveRestoreZoom {206 ns} {296 ns}
