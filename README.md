# SMART-COMMUTE

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S2

  > Member-1: HARSHINI.V, 221CS223, harshiniv.221cs223@nitk.edu.in 

  > member-2: RANGALLA SANJANA, 221CS237, sanjanarangalla.221cs237@nitk.edu.in

  > Member-3: VARAHI SUVARNA , 221CS259, varahisuvarna.221cs259@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
  Abstract: 

## Background:  

In India, there can be a lack of stringent enforcement of regulations regarding passenger limits and overloading. In some cases, buses are allowed to operate despite exceeding their capacity. In recent years, the transportation landscape has undergone significant transformations driven by technological advancements, evolving passenger expectations, and the pressing need for sustainable mobility solutions. In this context, our project seeks to address critical challenges and opportunities within the public transportation sector, with a focus on enhancing the overall passenger experience, safety, and efficiency of bus services. We’ll keep a counter that keeps track of the number of people entering the bus and display the number of free seats to the passengers. 

 

 ## Motivation:  

Ensuring the comfort and safety of bus passengers is paramount. Our project acknowledges the significance of creating a secure and pleasant environment for all travellers. As the world grapples with environmental concerns, public transportation plays a pivotal role in reducing emissions and promoting sustainability. Our project aligns with these global sustainability objectives. We plan to install energy efficient lights that adjust according to the time of the day.  

 

 ## Unique Contribution: 

1. Safety Rules: The system shall prevent passengers from standing near the door when available seats are unoccupied. The bus shall not start in such a case until the person sits down.  

2. Power Saving: When the bus is empty, the electrical appliances like lights inside the bus will be turned off leading to saving the power.  

3. Persistent Overload Alert: Our bus will not start in case any of the conditions go false, which makes for an efficient way to make sure the rules are obeyed.  

4. Regulatory Compliance: Our system includes a passenger counter to display current occupancy, aiding compliance with stringent safety regulations and preventing legal issues.  

5. Real-time Occupancy Awareness: Passengers receive a live count of occupants, empowering them to assess safety. 

 

 

## Brief Description: 

## Idea: 

To ensure safe and secure travel experience in local bus transportation by implementing the following conditions: 

1. Sending warning signals when bus gets overloaded. 

2.Displaying number of vacant seats. 

3.Checking the ID’s of passengers to avoid any illegal practices. 

4.Giving a warning signal when someone is standing near the door. 

5.Conserving energy by switching off lights if no one is inside the bus. 

 

## Existing issues: 

1. Road accidents due to overloading. 

2.Accidents due to people standing near the exit. 

3.Unauthorized people travelling inside the public transportation. 

## Approach: 

1.Using combinational and sequential circuits to design a model to count the number of passengers therefore avoiding overloading situations. 

2.Displaying the number of vacant seats in the bus by using a subtractor and subtracting the counter value from the maximum number (30) in the bus. 

3.Using two counters and checking if someone is standing at the door. 

4.Verifying the ID’s of the passengers with those ID’s already present in the database. 

 
</details>

<!-- Third Section -->
## Working
<details>
  <summary>Detail</summary>


**LOGISIM: WORKING**
  
## Initialization:

1. Set the 8-bit INPUT ID, the 3 valid ID's are (11111111,10000000,11111000).
2. Set constant 00000(0) as one of the input to the  first comparator.
3. Set constant 11110(30) (maximum seats in the bus) as one of the input to the subtractor which calculates and displays the number of empty seats.
4. Set constant 11110(30) as one of the input to the third comparator.

## Simulation:
1. Click the clock 1(counter 1) each time  a person enters the bus.
   Change the Counter1's value by clicking on clock, reset button to set to 0, and upordown for up counting(1) and down counting(0) for down.
2. Change the Counter2's value by clicking on clock, reset button to set to 0, and upordown for up counting(1) and down counting(0) for down.
3. The Lights output button will be 0 if Counter2 = 0.
4. The final output is 1 implies that the bus can move, if  its 0, then the corresponding LED will go on, indicating to the driver what the specific problem is.


**README FOR VERILOG**


The verilog has 7 modules.

Module 1: Comparator (comparator.v)   //Compares if the value of Count = 31, if yes then output x is 1.

Module 2: Counter (bus.v)      //it's a 5-bit synchronous up-down counter that simulates the passengers entering and leaving the bus.

Module 3: Subtractor (sub.v)   // Subtracts the value of count1 and count2, and assigns it to output z which is the number of people standing near the door.

Module 4: Comparator2 (comp2.v)    //checks if the value of z = 0 or not, if it is 0 then value of output k is 1

Module 5: Lights (lig.v)   // if count2 = 0, output light = 0, else light = 1.

Module 6: Id Verfifier (id.v)    // It checks if the user's id value is found in the database which has 3 valid ids. If a match is found, then output val_id is 1.

Module 7: Final Output (finst.v)      // decides if the bus should finally start or stop based on the 3 inputs, output is finout = 1 only if k = 1 && val_id = 1 && x = 0.




## Testbench 

		reset = 0;reset2=0;
                UpOrDown = 1;UpOrDown2=1;id1=01101101;id2=11111110;id3=01111101;vaid=01101101;
                #5;
		// Both the Counter 1 and Counter 2 are in up-counting state, the vaid(user's id) matches with the id1, so val_id =1.

                reset=1;
                UpOrDown = 0;UpOrDown2=1;id1=01101010;id2=00000111;id3=11100000;vaid=00001110;
                #5;
		// Counter1 is reset to 0 and user's id(00001110) doesn't match with those in database.

                reset = 0;reset2 = 0;
                UpOrDown = 1;UpOrDown2 = 1;id1=01000101;id2=11111111;id3=11100000;vaid=10000000;
                #5;
		// Counter1 and Counter2 continue counting from the previous state, the user's id (10000000) again doesn't match with those in the database.

                reset = 0;  reset2=1;id1=00011111;id2=00000111;id3=11101010;vaid=00011111;
                #5;
		//  Counter2 is reset to 0 and Counter 1 continues counting from the previous state, the user's id (00011111) matches with id1(00011111) in the    		database.



The testbench can be changed to the convenience to verify cases. 

> ## FUNCTIONAL TABLE

> OR GATE
![or](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/d9860787-330c-4ccd-bd4f-d9c47edf3a72)

> AND GATE
![and](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/1aaab453-cf43-457d-9205-68d402fc3189)




> 5 – Bit Comparator
![comp](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/dc1a07a9-9456-4326-9d7d-ce244f5f896d)



> D Flip-Flop 5-bit Synchronous Up-Down Counter
![1fn](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/091fd232-813d-45bb-989b-20997d84edb6)
![2fu](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/a620dbd8-884c-472b-833c-fb89cad9b8a6)
![3fu](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/1b04c792-6e54-454b-a4a5-a03ad9029772)





> NOT GATE
![notg](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/bdf17771-6456-457c-91c4-536d50ab113e)

> ## Flow Chart


![Untitled Diagram drawio (1)](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/3ac3695a-f21e-4086-add5-fa13e0719834)

</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>
  
  ![Logisim](https://github.com/harshini-20-05/DDS-MINI-PROJECT-23-24/assets/130059324/cbc950a5-6f71-4aef-b342-043503eb2941)

</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

  <details>
	  <summary>Verilog Main Code</summary>
	  
	`include "comparator.v"
	`include "bus.v"
	`include "sub.v"
	`include "comp2.v"
	`include "finst.v"
	`include "lig.v"
	`include "id.v"

	module main;

        reg Clk;reg Clk2;
        reg reset;reg reset2;reg [7:0] id1;
        reg [7:0] id2; reg [7:0] id3; reg [7:0] vaid;
        reg UpOrDown;reg UpOrDown2;

        wire x;wire [4:0] z;wire k;wire light;
        wire [4:0] Count;wire [4:0] Count2;
        wire finout;wire val_id;

        upordown_counter test(Clk,reset,UpOrDown,Count); // innermost counter
        upordown_counter test2(Clk2,reset2,UpOrDown2,Count2);

        sub test3(Count,Count2,z);// z is ppl standing

        comp2 test4(z,k);// k =1 if its 0 ppl standing
        comparator tests(Count,x);// x is 1 means 31 is reached
        id test6(vaid,id1,id2,id3,val_id);

        finst test5(x,k,val_id,finout);
        lig test7(Count2,light); // light is 0 if Count2=0
	


        initial begin
                Clk = 1;Clk2 = 1;
                forever #1 begin Clk = ~Clk; Clk2 = ~Clk2; end
        end

        initial begin
                $dumpfile("main.vcd");
                $dumpvars(0,main);

                $display("   User Id || Valid ID1 || Valid ID2 || Valid ID3 || Count1||  Count2   ||  Light  || Output ");
                $monitor("   %b |   %b |  %b |  %b  |   %b |    %b   |    %b    |    %b  ",vaid,id1,id2,id3,Count,Count2,light,finout);

        // Apply Inputs
                reset = 0;reset2=0;
                UpOrDown = 1;UpOrDown2=1;id1=01101101;id2=11111110;id3=01111101;vaid=01101101;
                #5;
                reset=1;
                UpOrDown = 0;UpOrDown2=1;id1=01101010;id2=00000111;id3=11100000;vaid=000001110;
                #5;
                reset = 0;reset2 = 0;
                UpOrDown = 1;UpOrDown2 = 1;id1=01000101;id2=11111111;id3=11100000;vaid=10000000;
                #5;
                reset = 0;  reset2=1;id1=00011111;id2=00000111;id3=11101010;vaid=00011111;
                #5;
        $finish;
    end

    endmodule

  </details>

  <details>
	  <summary>bus.v</summary>
	  
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


  </details>

  <details>
	  <summary>sub.v</summary>
	  
	  // counts the number of people standing near the door by subtracting the values in the two counters
	module sub(input [4:0] a, input [4:0] b, output reg [4:0] res );

        always @* begin
                res=a-b;
        end
	endmodule

  </details>

  <details>
	  <summary>comp2.v</summary>
	  
	  // returns 1 if there are 0 people standing
	module comp2(A,x);
        input [4:0]A;
        //input [4:0]B;
        output x;
        wire a,b,c,d,e;
        xnor(a,A[4],0);
        xnor(b,A[3],0);
        xnor(c,A[2],0);
        xnor(d,A[1],0);
        xnor(e,A[0],0);

        assign x=a&b&c&d&e;

	endmodule


  </details>

  <details>
	  <summary>finst.v</summary>
	  
	  // decides if the bus should finally be start or stop based on the 3 inputs
	module finst(input x,input k,input y, output finout);
        assign finout = ~x&k&y;


	endmodule

  </details>

  <details>
	  <summary>lig.v</summary>
	  
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

  </details>

  <details>
	  <summary>id.v</summary>
	  
	  // returns 1 as output if both the ids - id in database and the passengers id match
	module id(input [7:0] vaid, input [7:0] id1,input [7:0] id2,input [7:0] id3, output reg y);

        always@(vaid) 
                begin
                if(id1 == vaid || id2==vaid || id3==vaid)
                        y<=1;
                else
                        y<=0;

        end

	endmodule

  </details>
	
</details>




