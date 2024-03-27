`timescale 1ns/1ns
`include "Arraymul_eight_four.v"

module Arraymul_eight_four_tb;

reg [7:0] A;
reg [3:0] B;
wire [11:0] R;

Arraymul_eight_four uut(.A(A), .B(B), .R(R));

// Iterate over all possible 8-bit values for A and B
integer i;
integer j;

// Open a file for writing
integer file_id;

initial begin
    
    file_id = $fopen("output2.txt", "w");
    if (file_id == 0) begin
        $display("Error opening file for writing");
        $finish;
    end
    
    $dumpfile("Arraymul_eight_four_tb.vcd");
    $dumpvars(0, Arraymul_eight_four_tb);
    

    for (i = 0; i < 256; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            A = i;
            B = j;
            #10; // Delay for simulation purposes
            
            // Write A, B, and R to the file
            $fdisplay(file_id, "A = %d, B = %d, R = %d", A, B, R);
        end
    end
    
    // Close the file
    $fclose(file_id);
    
    // Finish simulation after all iterations
    $finish;
end

endmodule


