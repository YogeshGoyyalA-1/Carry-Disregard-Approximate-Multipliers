`timescale 1ns/1ns
`include "Arraymul_eight_eight.v"

module Arraymul_eight_eight_tb;

reg [7:0] A, B;
wire [15:0] R;

Arraymul_eight_eight uut(.A(A), .B(B), .R(R));

// Iterate over all possible 8-bit values for A and B
integer i;
integer j;

// Open a file for writing
integer file_id;

initial begin
    
    file_id = $fopen("output.txt", "w");
    if (file_id == 0) begin
        $display("Error opening file for writing");
        $finish;
    end
    
    $dumpfile("Arraymul_eight_eight_tb.vcd");
    $dumpvars(0, Arraymul_eight_eight_tb);
    

    for (i = 0; i < 256; i = i + 1) begin
        for (j = 0; j < 256; j = j + 1) begin
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


