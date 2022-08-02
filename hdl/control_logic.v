`include "../inc/risc_v_defines.vh"
module control_logic (
	input             clk           ,    // Clock
	input             reset_n       ,  // Asynchronous reset active low
	input             BrEq          ,
	input             BrLt          ,
	input      [31:0] Inst          ,
	output reg [ 2:0] ImmSel        ,
	output reg        RegWriteEnable,
	output reg        PCSel         ,
	output reg        BrUn          ,
	output reg        ASel          ,
	output reg        BSel          ,
	output reg [ 2:0] ALUSel        ,
	output reg        mem_read      ,
	output reg        mem_write     ,
	output reg        WBSel          
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

localparam [2:0]  R = 3'b001,
                  I = 3'b010,
                  S = 3'b011,
                  B = 3'b100,
                  J = 3'b101;

assign opcode = Inst[6:0];
assign funct3 = Inst[14:12];
assign funct7 = Inst[31:25];


always @(*) begin
	case (opcode)
		R_OPCODE: begin
			ImmSel         = R;
			RegWriteEnable = 1;
			ASel           = 0; // Reg
			BSel           = 0; // Reg
			mem_read       = 1;
			WBSel          = 1; // alu
			PCSel          = 0;	// +4
			BrUn           = 0;
			case ({funct3, funct7})
				{`ADD_FUNCT3, `ADD_FUNCT7}: begin
					ALUSel         = 3'b000; // Add Mem
				end
				{`SUB_FUNCT3, `SUB_FUNCT7}: begin
					ALUSel         = 3'b001; // Add Mem
					
				end
				{`XOR_FUNCT3, `XOR_FUNCT7}: begin
					ALUSel         = 3'b010; // Add Mem
					
				end
				{`OR_FUNCT3, `OR_FUNCT7}: begin
					ALUSel         = 3'b011; // Add Mem
					
				end
				{`AND_FUNCT3, `AND_FUNCT7}: begin
					ALUSel         = 3'b100 // Add Mem
				end

				{`SLL_FUNCT3, `SLL_FUNCT7}: begin
					ALUSel         = 3'b101; // Add Mem
				end

				{`SRL_FUNCT3, `SRLD_FUNCT7}: begin
					ALUSel         = 3'b110; // Add Mem
				end

				{`SRA_FUNCT3, `SRA_FUNCT7}: begin
					ALUSel         = 3'b111; // Add Mem
				end
				default : /* default */;
					ALUSel         = 0; // Add Mem
			endcase
		end

		I_LOAD_OPCODE: begin
			ImmSel         = I;
			RegWriteEnable = 1; // MEM
			ASel           = 0; // Reg
			BSel           = 1; // Imm
			mem_read       = 1; // Read
			WBSel          = 0; // Mem
			PCSel          = 0;	// +4
			BrUn           = 0;
			ALUSel         = 0; // Add I
			endcase
		end

		I_MATH_OPCODE: begin
			ImmSel         = I;
			RegWriteEnable = 1; // 0
			ASel           = 0; // Reg
			BSel           = 1; // Imm
			mem_read       = 1; // Read
			WBSel          = 1; // ALU
			PCSel          = 0; // + 4
			BrUn           = 0;
			case ({funct3, funct7})
				{`ADDI_FUNCT3}: begin
					ALUSel         = 3'b000; // Add Mem
				end
				{`SUBI_FUNCT3}: begin
					ALUSel         = 3'b001; // Add Mem
					
				end
				{`XORI_FUNCT3}: begin
					ALUSel         = 3'b010; // Add Mem
					
				end
				{`ORI_FUNCT3}: begin
					ALUSel         = 3'b011; // Add Mem
					
				end
				{`ANDI_FUNCT3}: begin
					ALUSel         = 3'b100 // Add Mem
				end

				{`SLLI_FUNCT3}: begin
					ALUSel         = 3'b101; // Add Mem
				end

				{`SRLI_FUNCT3}: begin
					ALUSel         = 3'b110; // Add Mem
				end

				{`SRAI_FUNCT3}: begin
					ALUSel         = 3'b111; // Add Mem
				end
				default : /* default */;
					ALUSel         = 0; // Add Mem
		end

		S_OPCODE: begin
			ImmSel         = S;
			RegWriteEnable = 0; 
			ASel           = 0; // reg
			BSel           = 1; // Imm
			ALUSel         = 0; // add
			mem_write      = 1; // write
			WBSel          = 0;
			PCSel          = 0;
			BrUn           = 0;
			ALUSel         = 0; // Add I
		end

		B_OPCODE: begin
			case (funct3)
				{`BEQ_FUNCT3} : begin
					PCSel     = BrEq ? 1 : 0; // ALU : +4
				end

				{`BNE_FUNCT3} : begin
					PCSel     = BrEq ? 0 : 1; // +4 : ALU
				end	

				{`BLT_FUNCT3} : begin
					PCSel     = BrLt ? 1 : 0; // ALU : + 4
				end	

				{`BGE_FUNCT3} : begin
					PCSel = BrEq ? 1 : (BrLt) ? 0 : 1;
				end	
				default : 
					PCSel = 0;
			endcase
			ImmSel         = B;
			RegWriteEnable = 0;
			ASel           = 0;
			BSel           = 0;
			ALUSel         = 0;
			mem_read       = 1;
			WBSel          = 0;
			BrUn           = 0;
			ALUSel         = 0; // Add I
		end
		default : begin
			ImmSel         = 0;
			RegWriteEnable = 0;
			ASel           = 0;
			BSel           = 0;
			ALUSel         = 0;
			mem_read       = 0;
			mem_write      = 0;
			WBSel          = 0;
			PCSel          = 0;
			BrUn           = 0;
		end
	endcase

end


endmodule : control_logic