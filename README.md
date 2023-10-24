*****README FOR LOGISM*****
Initialization:

1. Set the 8-bit INPUT ID, the 3 valid ID's are (11111111,10000000,11111000).
2. Set constant 00000(0) as one of the input to the  first comparator.
3. Set constant 11110(30) (maximum seats in the bus) as one of the input to the subtractor which calculates and displays the number of empty seats.
4. Set constant 11110(30) as one of the input to the third comparator.

Simulation:
1. Click the clock 1(counter 1) each time  a person enters the bus.
   Change the Counter1's value by clicking on clock, reset button to set to 0, and upordown for up counting(1) and down counting(0) for down.
2. Change the Counter2's value by clicking on clock, reset button to set to 0, and upordown for up counting(1) and down counting(0) for down.
3. The Lights output button will be 0 if Counter2 = 0.
4. The final output is 1 implies that the bus can move, if  its 0, then the corresponding LED will go on, indicating to the driver what the specific problem is.


***** README FOR Verilog ******


The verilog has 7 modules.

Module 1: Comparator (comparator.v)   //Compares if the value of Count = 31, if yes then output x is 1.

Module 2: Counter (bus.v)      //it's a 5-bit synchronous up-down counter that simulates the passengers entering and leaving the bus.

Module 3: Subtractor (sub.v)   // Subtracts the value of count1 and count2, and assigns it to output z which is the number of people standing near the door.

Module 4: Comparator2 (comp2.v)    //checks if the value of z = 0 or not, if it is 0 then value of output k is 1

Module 5: Lights (lig.v)   // if count2 = 0, output light = 0, else light = 1.

Module 6: Id Verfifier (id.v)    // It checks if the user's id value is found in the database which has 3 valid ids. If a match is found, then output val_id is 1.

Module 7: Final Output (finst.v)      // decides if the bus should finally start or stop based on the 3 inputs, output is finout = 1 only if k = 1 && val_id = 1 && x = 0.




Testbench 

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



The testbench can be changed to the convinience to verify cases. 






                                      ****** THE END *******
