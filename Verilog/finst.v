// decides if the bus should finally be start or stop based on the 3 inputs 
module finst(input x,input k,input y, output finout);
	assign finout = ~x&k&y;


endmodule
