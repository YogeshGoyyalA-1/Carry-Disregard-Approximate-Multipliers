`include "Arraymul_eight_eight.v"
`include "adder8_8.v"
`include "cdm8_aa.v"
`include "cdm8_84.v"
//`include "cla_sixteen.v"

module cdm16_f770 (
    input [15:0] A,         
    input [15:0] B,         
    output [31:0] R        
);

wire [15:0] R_low_low, R_high_low;
wire [15:0] R_low_high,R_high_high;

//---mul_1---//
cdm8_aa low_low_inst (  
    .A(A[7:0]),                 
    .B(B[7:0]),            
    .R(R_low_low)              
);

//---mul_2---//
cdm8_84 high_low_inst ( 
    .A(A[15:8]),                 
    .B(B[7:0]),            
    .R(R_high_low)             
);

//---mul_3---//
cdm8_84 low_high_inst (  
    .A(A[7:0]),                 
    .B(B[15:8]),            
    .R(R_low_high)              
);

//---mul_4---//
Arraymul_eight_eight high_high_inst (
    .A(A[15:8]),                 
    .B(B[15:8]),            
    .R(R_high_high)             
);

wire [7:0] R_low_low_low, R_low_low_high;
wire [7:0] R_high_low_low,R_high_low_high;
wire [7:0] R_low_high_low,R_low_high_high;
wire [7:0] R_high_high_low,R_high_high_high;
wire [7:0] x1,x2,x3,x4;

assign R_low_low_low = R_low_low[7:0];
assign R_low_low_high = R_low_low[15:8];
assign R_high_low_low = R_high_low[7:0];
assign R_high_low_high = R_high_low[15:8];
assign R_low_high_low = R_low_high[7:0];
assign R_low_high_high = R_low_high[15:8];
assign R_high_high_low = R_high_high[7:0];
assign R_high_high_high = R_high_high[15:8];


//---clax1---//
adder8_8 uut1 (
    .a(R_low_low_high),  
    .b(R_high_low_low),   
    .sum(x1)       
);

//---clax2---//
adder8_8 uut2 (
    .a(x1),  
    .b(R_low_high_low),   
    .sum(x2)      
);

//---clax3---//
adder8_8 uut3 (
    .a(R_high_low_high),  
    .b(R_low_high_high),   
    .sum(x3)         
);

//---clax4---//
adder8_8 uut4 (
    .a(x3),  
    .b(R_high_high_low),   
    .sum(x4)         
);

assign R[7:0]= R_low_low_low;
assign R[15:8]= x2;
assign R[23:16]= x4;
assign R[31:24]= R_high_high_high;


endmodule
