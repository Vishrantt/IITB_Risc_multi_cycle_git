module register(data_in,data_out,clk,w);

input [15:0] data_in;
input clk;
input w;
output [15:0] data_out;
reg [15:0] data_out;
reg [15:0] reg_m;

always@(posedge clk)
begin
	if (w == 1)
	reg_m <= data_in;
	else 
	reg_m <= reg_m;
end

always @(*)
begin	
	data_out <= reg_m;
end

endmodule
