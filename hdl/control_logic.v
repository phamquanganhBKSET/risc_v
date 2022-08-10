`include "../inc/risc_v_defines.vh"

module control_logic #(
  parameter INST_WIDTH     = `INST_WIDTH   ,
  parameter IMM_SEL_WIDTH  = `IMM_SEL_WIDTH 
)
(
	input             						 clk           ,  // Clock
	input             						 reset_n       ,  // Asynchronous reset active low
	input             						 br_eq         ,
	input             						 br_lt         ,
	input      [INST_WIDTH-1:0   ] inst          ,
	output reg [IMM_SEL_WIDTH-1:0] imm_sel       ,
	output reg        						 reg_write_en  ,
	output reg     						 	   pc_sel        ,
	output reg     						 	   br_un         ,
	output reg        						 ASel          ,
	output reg        						 BSel          ,
	output reg [2:0						 	 ] alu_sel       ,
	output reg     						 	   mem_write     ,
	output reg     						 	   wb_sel         
);

wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

//----------------------------------------------------------------
//         Opcopde
//----------------------------------------------------------------
localparam  R_OPCODE      = 7'b0110011,
            I_LOAD_OPCODE = 7'b0000011,
            I_MATH_OPCODE = 7'b0010011,
            S_OPCODE      = 7'b0100011,
            J_OPCODE      = 7'b1101111,
            B_OPCODE      = 7'b1100011;

assign opcode = inst[6:0];
assign funct3 = inst[14:12];
assign funct7 = inst[31:25];

always @(*) begin
	case (opcode)
		R_OPCODE: begin
			imm_sel         = `IMM_SEL_R;
			reg_write_en 		= 1;
			ASel            = 0; // Reg
			BSel            = 0; // Reg
			mem_write       = 0;
			wb_sel          = 1; // alu
			pc_sel          = 0;	// +4
			br_un           = 0;
			case ({funct3, funct7})
				{`ADD_FUNCT3, `ADD_FUNCT7}: begin
					alu_sel         = 3'b000; // Add Mem
				end
				{`SUB_FUNCT3, `SUB_FUNCT7}: begin
					alu_sel         = 3'b001; // Sub

				end
				{`XOR_FUNCT3, `XOR_FUNCT7}: begin
					alu_sel         = 3'b010; // Xor

				end
				{`OR_FUNCT3, `OR_FUNCT7}: begin
					alu_sel         = 3'b011; // Or

				end
				{`AND_FUNCT3, `AND_FUNCT7}: begin
					alu_sel         = 3'b100; // And
				end

				{`SLL_FUNCT3, `SLL_FUNCT7}: begin
					alu_sel         = 3'b101; // Sll
				end

				{`SRL_FUNCT3, `SRL_FUNCT7}: begin
					alu_sel         = 3'b110; // Srl
				end

				{`SRA_FUNCT3, `SRA_FUNCT7}: begin
					alu_sel         = 3'b111; // Sra
				end
				default : 
					alu_sel         = 0; // Add Mem
			endcase
		end

		I_LOAD_OPCODE: begin
			imm_sel         = `IMM_SEL_I;
			reg_write_en    = 1; // MEM
			ASel            = 0; // Reg
			BSel            = 1; // Imm
			mem_write       = 0; // Read
			wb_sel          = 0; // Mem
			pc_sel          = 0; // +4
			br_un           = 0;
			alu_sel         = 0; // Add I
		end

		I_MATH_OPCODE: begin
			imm_sel         = `IMM_SEL_I;
			reg_write_en  	= 1; // 0
			ASel           = 0; // Reg
			BSel           = 1; // Imm
			mem_write       = 0; // Read
			wb_sel          = 1; // ALU
			pc_sel          = 0; // + 4
			br_un           = 0;
			case ({funct3, funct7})
				{`ADDI_FUNCT3}: begin
					alu_sel         = 3'b000; // Add Mem
				end
				// {`SUBI_FUNCT3}: begin
				// 	alu_sel         = 3'b001; // Add Mem
				// end
				{`XORI_FUNCT3}: begin
					alu_sel         = 3'b010; // Add Mem

				end
				{`ORI_FUNCT3}: begin
					alu_sel         = 3'b011; // Add Mem

				end
				{`ANDI_FUNCT3}: begin
					alu_sel         = 3'b100;// Add Mem
				end

				{`SLLI_FUNCT3}: begin
					alu_sel         = 3'b101; // Add Mem
				end

				{`SRLI_FUNCT3}: begin
					alu_sel         = 3'b110; // Add Mem
				end

				{`SRAI_FUNCT3}: begin
					alu_sel         = 3'b111; // Add Mem
				end
				default : begin
					alu_sel         = 0; // Add Mem
				end
			endcase
		end

		S_OPCODE: begin
			imm_sel         = `IMM_SEL_S;
			reg_write_en  	= 0;
			ASel            = 0; // reg
			BSel            = 1; // Imm
			alu_sel         = 0; // add
			mem_write       = 1; // write
			wb_sel          = 0;
			pc_sel          = 0;
			br_un           = 0;
			alu_sel         = 0; // Add I
		end

		B_OPCODE: begin
			case (funct3)
				{`BEQ_FUNCT3} : begin
					pc_sel     = br_eq ? 1 : 0; // ALU : +4
				end

				{`BNE_FUNCT3} : begin
					pc_sel     = br_eq ? 0 : 1; // +4 : ALU
				end	

				{`BLT_FUNCT3} : begin
					pc_sel     = br_lt ? 1 : 0; // ALU : + 4
				end	

				{`BGE_FUNCT3} : begin
					pc_sel = br_eq ? 1 : (br_lt) ? 0 : 1;
				end	
				default : 
					pc_sel = 0;
			endcase
			imm_sel         = `IMM_SEL_B;
			reg_write_en  	= 0;
			ASel            = 0;
			BSel            = 0;
			alu_sel         = 0;
			mem_write       = 0;
			wb_sel          = 0;
			br_un           = 0;
			alu_sel         = 0; // Add I
		end
		default : begin
			imm_sel         = `IMM_SEL_R;
			reg_write_en  	= 0;
			ASel            = 0;
			BSel            = 0;
			alu_sel         = 0;
			mem_write       = 0;
			wb_sel          = 0;
			pc_sel          = 0;
			br_un           = 0;
		end
	endcase
end

endmodule : control_logic 