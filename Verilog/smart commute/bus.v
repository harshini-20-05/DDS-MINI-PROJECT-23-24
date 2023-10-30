// 5 bit up-down synchronous counter
module upordown_counter(
    Clk,
    reset,
    UpOrDown,  //high for UP counter and low for Down counter
    Count
    );

    
    //input ports and their sizes
    input Clk,reset,UpOrDown;
    //output ports and their size
    output [4 : 0] Count;
    //Internal variables
    reg [4 : 0] Count = 0;   
    //output reg[4:0] occupancy;
     always @(posedge(Clk) or posedge(reset))
     begin
        if(reset == 1) begin 
            Count <= 0;
           
        end else begin    
            if(UpOrDown == 1) begin   //Up mode selected
                if(Count == 30 | Count == 31 ) begin
           
		    Count <= 0;   
                end else begin
                    Count <= Count + 1; //Incremend Counter
	   
		    end
		end else begin  //Down mode selected
                if(Count == 0) begin
                    Count <= 31;
		   
				
                end else begin
                    Count <= Count - 1; //Decrement counter
			

     end    
end
end
end 


endmodule
