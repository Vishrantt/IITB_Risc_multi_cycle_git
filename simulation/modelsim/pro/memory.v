module memory(data_in,data_outs,addr,clk,rw);

input [15:0] data_in;
input clk;
input [1:0] rw;
input [4:0] addr;

reg [15:0] Memory [31:0];

output [15:0] data_outs;
reg [15:0] data_outs;


initial 
begin
Memory[0] <= 16'b0110_000_0_01_001_010;					
//Memory[0] <= 16'h0000;										
//Memory[0] <= 16'b0001_000_010_000010;					
//Memory[2] <= 16'b0011_000_00000_0000;					
//Memory[5] <= 16'b0001_001_101_000100;					
Memory[1] <= 16'b0000_000_011_000001;
Memory[3] <= 16'b1100_011_001_000001;
Memory[5] <= 16'b1100_100_001_000001;
Memory[8] <= 16'd0;
Memory[9] <= 16'd0;
Memory[10] <= 16'd0;		
Memory[11] <= 16'd0;			
end

always @ (posedge clk)
begin
	if (rw == 2'b01)
	Memory[addr] <= data_in;		
end

always @ (*)
begin 
	if (rw == 2'b10)
	data_outs <= Memory[addr];
	else
	data_outs <= 16'b0;
end

endmodule
