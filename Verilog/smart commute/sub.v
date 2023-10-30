// counts the number of people standing near the door by subtracting the values in the two counters
module sub(input [4:0] a, input [4:0] b, output reg [4:0] res );

	always @* begin
		res=a-b;
	end
endmodule
