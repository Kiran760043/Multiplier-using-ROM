//////////////////////////////////////////////////////////////////////////////////
// Design: 4-bit Multiplier using ROM
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module Mult_ROM(clk,rst,A,B,R);
    input  wire clk;
    input  wire rst;
    input  wire[3:0] A;
    input  wire[3:0] B;
    output wire[7:0] R;
    
    reg [7:0]rom[15:0][15:0];
    
    byte unsigned opA,opB;
    
    initial
      begin
          $display ("loading ROM");
          $readmemh("multiplierROM.mem",rom);  //holds the value for seven segment display
        end
    
    always@(posedge clk,posedge rst)
        begin
            if(rst)begin
                opA <= 0;
                opB <= 0;
             end else begin
                opA <= A;
                opB <= B;
             end
        end
        
    assign R = rom[opA][opB];
endmodule
