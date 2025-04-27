
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/07/2025 02:51:03 PM
// Design Name:
// Module Name: tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
 
 
module tb();
 
reg [8:0] instr_addr, data_addr;
reg [31:0] instr, data;
reg wei,wed;
wire done;
reg clk, rst;
wire [31:0] ans;
processor_top workpls(clk,rst,instr,instr_addr, data, data_addr, wei,wed,ans,done);
 
initial
begin
wed <=0;
rst <= 1;
wei <= 1;
# 10
 
//INSERTION SORT!!!!!
instr_addr<= 9'd0;
instr <= {6'd1, 5'd0, 5'd1, 16'd0}; //0:  addi $1, $0, 0
#10
 
instr_addr<= 9'd1;
instr <= {6'd1, 5'd0, 5'd3, 16'd5}; //addi $3, $0, 5
#10
 
instr_addr<= 9'd2;
instr <= {6'd1, 5'd0, 5'd1, 16'd0}; //addi $1, $0, 0
#10
 
instr_addr<= 9'd3;
instr <= {6'd1, 5'd1, 5'd1, 16'd1}; //addi $1, $1, 1
#10
 
instr_addr<= 9'd4;
instr <= {6'd9, 5'd3, 5'd1, 16'd13}; //beq $3, $1, 13
#10
 
instr_addr<= 9'd5;
instr <= {6'd1, 5'd1, 5'd2, 16'hffff}; //addi $2, $1, -1
#10
 
instr_addr<= 9'd6;
instr <= {6'd1, 5'd2, 5'd5, 16'd1}; // addi $5, $2, 1
#10
 
instr_addr<= 9'd7;
instr <= {6'd6, 5'd2, 5'd7, 16'd0}; // lw $7, $2(0)
#10
 
instr_addr<= 9'd8;
instr <= {6'd6, 5'd5, 5'd8, 16'd0}; //lw $8, $5(0)
#10
 
instr_addr<= 9'd9;
instr <= {6'd12, 5'd8, 5'd7, 16'h6}; //addi $2, $1, -1
#10
 
instr_addr<= 9'd10;
instr <= {6'd7, 5'd5, 5'd7, 16'd0}; // addi $5, $2, 1
#10
 
instr_addr<= 9'd11;
instr <= {6'd7, 5'd2, 5'd8, 16'd0}; // lw $7, $2(0)
#10
 
instr_addr<= 9'd12;
instr <= {6'd9, 5'd0, 5'd2, 16'd3}; //lw $8, $5(0)
#10
 
instr_addr<= 9'd13;
instr <= {6'd1, 5'd2, 5'd2, 16'hffff}; // lw $7, $2(0)
#10
 
instr_addr<= 9'd14;
instr <= {6'd1, 5'd2, 5'd5, 16'd1}; //lw $8, $5(0)
#10
 
instr_addr<= 9'd15;
instr <= {6'd9, 5'd0, 5'd0, 16'hfff7 }; //addi $2, $1, -1
#10
 
instr_addr<= 9'd16;
instr <= {6'd9, 5'd0, 5'd0, 16'hfff2}; // addi $5, $2, 1
#10

instr_addr<= 9'd17;
instr <= 32'hffffffff; // lw $7, $2(0)
//#10
 
instr_addr<= 9'd18;
instr <= 32'hffffffff; //lw $8, $5(0)
#10


//MULTIPLY STUFF

//instr_addr<= 9'd0;
//instr <= {6'd1, 5'd2, 5'd2, 16'd9}; // addi
//#10

//instr_addr<= 9'd1;
//instr <= {6'd1, 5'd3, 5'd3, 16'd8}; // addi
//#10

//instr_addr<= 9'd2;
//instr <= {6'd0, 5'd2, 5'd3, 5'd0, 5'd0, 6'd6}; // mul
//#10

//instr_addr<= 9'd3;
//instr <= {6'd41, 26'd0}; // mflo
//#10

//instr_addr<= 9'd4;
//instr <= {6'd7, 5'd29, 5'd30, 16'd0}; // sw
//#10
//instr_addr<= 9'd5;
//instr <= 32'hffffffff; // end
//#10


////FLOATING POINT SUBTRACTION
//instr_addr<= 9'd0;
//instr <= {6'd8, 5'd2, 5'd2, 16'h4013}; // lui
//#10

//instr_addr<= 9'd1;
//instr <= {6'd4, 5'd2, 5'd2, 16'h3333}; // ori
//#10

//instr_addr<= 9'd2;
//instr <= {6'd8, 5'd3, 5'd3, 16'h3f99}; // lui
//#10

//instr_addr<= 9'd3;
//instr <= {6'd4, 5'd3, 5'd3, 16'h999a}; // ori
//#10

//instr_addr<= 9'd4;
//instr <= {6'd24, 5'd2, 5'd2, 16'd0}; // mtc1
//#10

//instr_addr<= 9'd5;
//instr <= {6'd24, 5'd3, 5'd3, 16'd0}; // mtc1
//#10

//instr_addr<= 9'd6;
//instr <= {6'd22, 5'd2, 5'd3, 5'd4, 5'd0, 6'd0}; // sub.s
//#10

//instr_addr<= 9'd7;
//instr <= {6'd23, 5'd4, 5'd0, 16'h0}; // mfc1
//#10

//instr_addr<= 9'd8;
//instr <= {6'd7, 5'd0, 5'd31, 16'd0}; // sw
//#10

//instr_addr<= 9'd9;
//instr <= 32'hffffffff; // end
//#10

 
wei <= 0;
wed <= 1;
#10
 
data_addr <= 9'd0;
data <= 32'd10;
#10
 
data_addr <= 9'd1;
data <= 32'd13;
#10
 
data_addr <= 9'd2;
data <= 32'd5;
#10
 
data_addr <= 9'd3;
data <= 32'd6;
#10
 
data_addr <= 9'd4;
data <= 32'd2;
#10
 

 
rst <= 0;
wed <= 0;
wei <=0;
#10

#5000 $finish;
 
end
 
initial
begin
    clk <= 0;
    forever #1 clk <= ~clk;
end
 
endmodule
