`include "comparator.v"
`include "bus.v"
`include "sub.v"
`include "comp2.v"
`include "finst.v"
`include "lig.v"
`include "id.v"

module main;

	reg Clk;reg Clk2;
	reg reset;reg reset2;reg [7:0] id1;reg [7:0] vaid;
	reg UpOrDown;reg UpOrDown2;

	wire x;wire [4:0] z;wire k;wire light;
	wire [4:0] Count;wire [4:0] Count2;
	wire finout;wire val_id;

	upordown_counter test(Clk,reset,UpOrDown,Count); // innermost counter
	upordown_counter test2(Clk2,reset2,UpOrDown2,Count2);

	sub test3(Count,Count2,z);// z is ppl standing

	comp2 test4(z,k);// k =1 if its 0 ppl standing
	comparator tests(Count,x);// x is 1 means 31 is reached
	id test6(id1,vaid,val_id);

	finst test5(x,k,val_id,finout);
	lig test7(Count2,light); // light is 0 if Count2=0

	initial begin
		Clk = 1;Clk2 = 1;
		forever #1 begin Clk = ~Clk; Clk2 = ~Clk2; end
	end

	initial begin
		$dumpfile("main.vcd");
		$dumpvars(0,main);

		$display("   User Id ||Valid Id||  Count1 ||   Count2 ||  Light  || Output ");
		$monitor("   %b   |  %b |   %b |    %b   |    %b    |    %b  ",id1,vaid,Count,Count2,light,finout);

        // Apply Inputs
		reset = 0;reset2=0;
		UpOrDown = 1;UpOrDown2=1;id1=01101101;vaid=01101101;
        	#5;
		reset=1;
		UpOrDown = 0;UpOrDown2=1;id1=01101010;vaid=01100010;
      		#5;
		reset = 0;reset2 = 0;
		UpOrDown = 1;UpOrDown2 = 1;id1=01000101;vaid=01010101;
        	#5;
		reset = 0;  reset2=1;id1=00011111;vaid=00011111;
		#5;
	$finish;
    end

endmodule
