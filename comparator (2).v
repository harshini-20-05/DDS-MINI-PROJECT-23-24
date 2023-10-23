//gives output as 1 if maximum value of passengers is exceeded(30 and becomes 31) are same
module comparator(A,x);
	input [4:0]A;
	
	output x;
	wire a,b,c,d,e;
	xnor(a,A[4],1);
	xnor(b,A[3],1);
	xnor(c,A[2],1);
	xnor(d,A[1],1);
	xnor(e,A[0],1);
	
	assign x=a&b&c&d&e;
	
endmodule
