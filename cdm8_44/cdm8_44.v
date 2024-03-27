`include "cd4.v"
`include "allblocks.v"
//`include "Arraymul_eight_four.v"
`include "cla_sixteen.v"


module cdm8_44 (
    input [7:0] A,         // Input array A, 8 bits wide
    input [7:0] B,         // Input array B, 8 bits wide
    output [15:0] R        // Output array R, 16 bits wide
);

wire [11:0] R_low, R_high;
wire [15:0] R_high_shifted,R_low_padded;
wire useless;

// Instantiate the Arraymul_eight_four module for the least significant bits of B
cd4 low_inst (
    .A(A),                 // Connect input array A
    .B(B[3:0]),            // Connect least significant 4 bits of input array B
    .R(R_low)              // Connect output array R_low
);

// Instantiate the Arraymul_eight_four module for the most significant bits of B
cd4 high_inst (
    .A(A),                 // Connect input array A
    .B(B[7:4]),            // Connect most significant 4 bits of input array B
    .R(R_high)             // Connect output array R_high
);

// Concatenate the results to form the output array R

// Left shift R_high by 4 bits (equivalent to multiplying by 16)
assign R_high_shifted = {R_high, 4'b0};

// Pad R_low with 4 additional zero bits
assign R_low_padded = {4'b0, R_low};

// Instantiate cla_sixteen module with required connections
cla_sixteen uut (
    .A(R_high_shifted),  // Connect R_high_shifted as A
    .B(R_low_padded),    // Connect R_low_padded as B
    .Cin(1'b0),          // Connect Cin as 0
    .S(R[15:0]),         // Connect lower 16 bits of output R as S
    .Cout(useless)         // Connect Cout of cla_sixteen as Cout
);


endmodule
