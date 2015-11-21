module Priority_enc(in, out3);

input [7:0] in;
output [3:0] out3;
reg [3:0] out3;

always @(*)
begin
	if (in[7] == 1'b1)
	out3 <= 4'b1111;
	else if (in[6] == 1'b1)
	out3 <= 4'b1101;
	else if (in[5] == 1'b1)
	out3 <= 4'b1011;
	else if (in[4] == 1'b1)
	out3 <= 4'b1001;
	else if (in[3] == 1'b1)
	out3 <= 4'b0111;
	else if (in[2] == 1'b1)
	out3 <= 4'b0101;
	else if (in[1] == 1'b1)
	out3 <= 4'b0011;
	else if (in[0] == 1'b1)
	out3 <= 4'd0001;
	else 
	out3 <= 4'd0000;
end

	
endmodule
	
	
	
	