`timescale 1ns/1ns
`include "adder8_8.v"

module adder8_8_tb;

reg [7:0] a, b;
wire [7:0] sum;

adder8_8 uut(.a(a), .b(b), .sum(sum));

// Iterate over all possible 8-bit values for A and B
integer i;
integer j;

// Open a file for writing
integer file_id;

initial begin
    
    file_id = $fopen("output3.txt", "w");
    if (file_id == 0) begin
        $display("Error opening file for writing");
        $finish;
    end
    
    $dumpfile("adder8_8_tb.vcd");
    $dumpvars(0, uut);
    
    //c0=1'b0;
    for (i = 0; i < 256; i = i + 1) begin
        for (j = 0; j < 256; j = j + 1) begin
            a = i;
            b = j;
            #10; // Delay for simulation purposes
            
            // Write A, B, and R to the file
            $fdisplay(file_id, "A = %d, B = %d, S = %d", a, b, sum);
        end
    end
    
    // Close the file
    $fclose(file_id);
    
    // Finish simulation after all iterations
    $finish;
end

endmodule


