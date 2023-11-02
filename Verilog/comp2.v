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
