// decides if light should be off if there are 0 people and on otherwise
module lig(input [4:0] count, output reg light);
	always @*
	begin
		if(count==0)
			light<=0;

		else
			light<=1;
	end

endmodule
