module controller(clk, count, enable, reset, reset_pin, load, op_sel, regw, rw, mux_ccr_sel, mux_memw_sel, mux_a_sel, mux_B_sel, mux_adi_sel, mux_alu_sel, mux_mem_sel, mux_reg_sel, mux_pc_sel, mux_pcw_sel, opcode, cz, wa, wb, wmdr, wccr, walu, wir, equal, aorb); 

input clk, equal;
input [15:0] opcode;
input [1:0] cz;
input [3:0] count;
input reset_pin;
output reset;
reg reset;
//output [4:0] state;
output [1:0] rw;
output [1:0] op_sel;
output [1:0] mux_alu_sel;
output mux_mem_sel, mux_memw_sel, mux_ccr_sel;
output [1:0] mux_a_sel;
output [1:0] mux_reg_sel;
output [1:0] mux_pcw_sel;
output [1:0]mux_pc_sel;
output mux_B_sel, mux_adi_sel;
output wa, wb, wmdr, wccr, walu, wir, aorb, regw, load, enable;
reg mux_memw_sel;
wire equal;
wire [15:0] opcode;
wire [1:0] cz;
wire [3:0] count;
reg [4:0] state;
reg [4:0] next_state;
reg [1:0] rw;
reg [1:0] op_sel;
reg [1:0] mux_alu_sel;
reg mux_mem_sel, mux_ccr_sel;
reg [1:0] mux_a_sel; 
reg [1:0] mux_reg_sel;
reg [1:0] mux_pcw_sel;
reg [1:0]mux_pc_sel;
reg mux_B_sel;
reg wa, wb, wmdr, wccr, walu, wir, aorb, regw, load, enable, mux_adi_sel; 
parameter ir_fetch = 5'd0;
parameter decode   = 5'd1;
parameter ALU 		 = 5'd2;
parameter Reg_write= 5'd3;
parameter ADI		 = 5'd4;
parameter ADI_w	 = 5'd5;
parameter LW1	    = 5'd6;
parameter LW2	    = 5'd7;
parameter SW2	    = 5'd8;
parameter BEQ1     = 5'd9;
parameter BEQ2  	 = 5'd10;
parameter JLR1	    = 5'd11;
parameter JLR2  	 = 5'd12;
parameter LHI  	 = 5'd13;
parameter JAL2  	 = 5'd14;
parameter Counter  = 5'd15;
parameter LM1  	 = 5'd16;
parameter LM2  	 = 5'd17;
parameter SM1  	 = 5'd18;
parameter SM2  	 = 5'd19;
parameter SM3  	 = 5'd20;
parameter Reset   = 5'd21;
always@(state)
begin 
	case(state)
		ir_fetch:
		begin
			load         <= 1;
			reset			 <= 0;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b01;
			mux_mem_sel  <= 0;
			wir          <= 1;
			wa           <= 1;
			mux_alu_sel  <= 2'b10;
			op_sel       <= 2'b00;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b01;
			wmdr         <= 0;
			wccr         <= 0;
			rw           <= 2'b10;
			walu         <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		decode:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 1;
			wb           <= 1;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end 
		ALU:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= opcode[13:12];
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= (~opcode[13]);
			walu         <= 1;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		Reg_write:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		ADI:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b00;
			mux_alu_sel  <= 2'b11;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= 1;
			walu         <= 1;
			wir          <= 0;
			wa           <= 1;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end	
		ADI_w:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 1;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		LW1:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b10;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b00;
			mux_alu_sel  <= 2'b11;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 1;
			wir          <= 0;
			wa           <= 1;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 1;
		end	
		LW2:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b00;
			mux_mem_sel  <= 1;
			rw           <= 2'b10;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b01;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 1;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 1;
		end		
		SW2:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 1;
			rw           <= 2'b01;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b01;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 1;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end	
		BEQ1:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 1;
			rw           <= 2'b00;
			op_sel       <= 2'b01;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b01;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 1;
			wir          <= 0;
			wa           <= 1;
			wb           <= 1;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end		
		BEQ2:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b01;
			mux_mem_sel  <= 0;
			wir          <= 0;
			wa           <= 0;
			mux_alu_sel  <= 2'b11;
			op_sel       <= 2'b00;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b01;
			wmdr         <= 0;
			wccr         <= 0;
			rw           <= 2'b00;
			walu         <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end	
		JLR1:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b01;
			mux_mem_sel  <= 1;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 1;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 1;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		JLR2:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 1;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b01;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 1;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		LHI:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 1;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b10;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end		
		JAL2:
		begin
			reset			 <= 0;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 2'b01;
			mux_mem_sel  <= 0;
			wir          <= 0;
			wa           <= 0;
			mux_alu_sel  <= 2'b01;
			op_sel       <= 2'b00;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b01;
			wmdr         <= 0;
			wccr         <= 0;
			rw           <= 2'b00;
			walu         <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		Counter:
		begin
			reset			 <= 0;
			load         <= 0;
			enable		 <= 1;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b10;
			mux_reg_sel  <= 2'b01;
			mux_pcw_sel  <= 2'b10;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end		
		LM1:
		begin
			reset			 <= 0;
			load         <= 0;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b10;
			op_sel       <= 2'b00;
			mux_alu_sel  <= 2'b10;
			mux_reg_sel  <= 2'b01;
			mux_pcw_sel  <= 2'b10;
			wmdr         <= 1;
			wccr         <= 0;
			walu         <= 1;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 1;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 2'b01;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end	
		LM2:
		begin
			reset			 <= 0;
			load         <= 0;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 1;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 2'b10;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		SM1:
		begin
			reset			 <= 0;
			load         <= 0;
			enable		 <= 0;
			mux_B_sel    <= 1;
			mux_pc_sel   <= 2'b11;
			mux_mem_sel  <= 0;
			rw           <= 2'b01;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b01;
			mux_pcw_sel  <= 2'b10;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 2'b01;
			mux_memw_sel <= 1;
			mux_ccr_sel  <= 0;
		end	
		SM2:
		begin
			reset			 <= 0;
			load         <= 0;
			enable		 <= 0;
			mux_B_sel    <= 1;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b00;
			mux_alu_sel  <= 2'b10;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 1;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 2'b01;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		SM3:
		begin
			reset			 <= 0;
			load         <= 0;
			enable		 <= 0;
			mux_B_sel    <= 1;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b10;
			mux_reg_sel  <= 2'b11;
			mux_pcw_sel  <= 2'b11;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 1;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 2'b10;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		Reset:
		begin
			reset			 <= 1;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			rw           <= 2'b00;
			op_sel       <= 2'b11;
			mux_alu_sel  <= 2'b00;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= 0;
			walu         <= 0;
			wir          <= 0;
			wa           <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 2'b00;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
		default:
		begin
			reset			 <= 1;
			load         <= 1;
			enable		 <= 0;
			mux_B_sel    <= 0;
			mux_pc_sel   <= 0;
			mux_mem_sel  <= 0;
			wir          <= 0;
			wa           <= 0;
			mux_alu_sel  <= 2'b00;
			op_sel       <= 2'b11;
			mux_reg_sel  <= 2'b00;
			mux_pcw_sel  <= 2'b00;
			wmdr         <= 0;
			wccr         <= 0;
			rw           <= 2'b00;
			walu         <= 0;
			wb           <= 0;
			regw			 <= 0;
			aorb         <= 0;
			mux_adi_sel  <= 0;
			mux_a_sel    <= 0;
			mux_memw_sel <= 0;
			mux_ccr_sel  <= 0;
		end
	endcase
end

always @(posedge clk)
begin
	state <= next_state;
end

always @(*)
begin
	case(state)
		ir_fetch:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= decode;
		end
		
		decode:
		begin
		if(reset_pin)
		next_state <= Reset;
		else if (opcode [15:14] == 2'b00 && opcode[12] == 0 && (opcode[1:0] == 2'b00 || (opcode[1:0] == 2'b01 && cz[1] == 1'b1) || (opcode[1:0] == 2'b10 && cz[0] == 1'b1)))
		next_state <= ALU;
		else if (opcode [15:14] == 2'b00 && opcode[12] == 0)
		next_state <= ir_fetch;	
		else if (opcode [15:13] == 3'b010)
		next_state <= LW1;
		else if (opcode [15:12] == 4'b0001)
		next_state <= ADI;
		else if (opcode [15:12] == 4'b0011)
		next_state <= LHI;
		else if (opcode [15:13] == 3'b011)
		next_state <= Counter;
		else if (opcode [15:12] == 4'b1100)
		next_state <= BEQ1;
		else if (opcode [15:13] == 3'b100)
		next_state <= JLR1;
		else
		next_state <= ir_fetch;
		end
		
		ALU:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= Reg_write;
		end
		
		Reg_write:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		LW1:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		if(opcode[12] == 1'b0)
		next_state <= LW2;
		else 
		next_state <= SW2;
		end
		
		LW2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		SW2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		ADI:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ADI_w;
		end
		
		ADI_w:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		LHI:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		BEQ1:
		begin
		if(reset_pin)
		next_state <= Reset;
		else if (equal)
		next_state <= BEQ2;
		else
		next_state <= ir_fetch;
		end
		
		BEQ2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		JLR1:
		begin
		if(reset_pin)
		next_state <= Reset;
		else if (opcode[12] == 1'b1)
		next_state <= JLR2;
		else 
		next_state <= JAL2;
		end
		
		JLR2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		JAL2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
		
		Counter:
		begin
		if(reset_pin)
		next_state <= Reset;
		else if(opcode[7:0] == 8'b0)
		next_state <= ir_fetch;
		else if (opcode[count+4'd1] == 1'b0 && (count+4'd1)<4'd8)
		next_state <= Counter;
		else if (opcode[count+4'd1] == 1'b1 && (count+4'd1)<4'd8 && opcode[12] == 1'b0)
		next_state <= LM1;
		else if (opcode[count+4'd1] == 1'b1 && (count+4'd1)<4'd8 && opcode[12] == 1'b1)
		next_state <= SM1;		
		else
		next_state <= ir_fetch;
		end
		
		LM1:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= LM2;
		end
		
		LM2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= Counter;
		end
		
		SM1:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= SM2;
		end
		
		SM2:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= SM3;
		end
		
		SM3:
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= Counter;
		end
		default: 
		begin
		if(reset_pin)
		next_state <= Reset;
		else
		next_state <= ir_fetch;
		end
	endcase
		
end
endmodule	
	
			