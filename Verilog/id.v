// returns 1 as output if both the ids - id in database and the passengers id match
module id(input [7:0] id, input [7:0] vaid, output reg y);

	always@(vaid)
		begin
		if(id == vaid)
			y<=1;
		else
			y<=0;

	end

endmodule
