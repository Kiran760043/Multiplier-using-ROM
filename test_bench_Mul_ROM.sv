//////////////////////////////////////////////////////////////////////////////////
// Design: Test Bench for 4-bit Multiplier using ROM
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench_Mul_ROM();
    //inputs for DUT
        logic clk;
        logic rst;
        logic [3:0] A;
        logic [3:0] B;
    //outputs form DUT
        logic [7:0]Result;
        
        
    Mult_ROM DUT (.clk(clk),.rst(rst),.A(A),.B(B),.R(Result));
    
    initial
        begin
            $display($time," << Simulation Results >>");
            $monitor($time,"clk=%b, rst=%b, operand_A=%d, operand_B=%d, Result=%d",clk,rst,A,B,Result);
        end
     
     always #5 clk = ~clk;
     
     initial
        begin
            clk = 0;
            rst = 1;
            #20
            rst = 0;
            A   = 4;
            B   = 6;
            #20
            A   = 10;
            B   = 10;
            #20
            A   = 2;
            B   = 1;
            #20
            rst = 1;
            #20
            rst = 0;
            A   = 6;
            B   = 6;
            #20
            A   = 15;
            B   = 15;
            #20
            $finish;
        end
endmodule
