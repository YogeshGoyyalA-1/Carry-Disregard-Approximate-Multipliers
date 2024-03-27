`timescale 1ns/1ns
`include "array_combine_88.v"

module array_combine_88_tb;

reg [7:0] A, B;
wire [16:0] R;

array_combine_88 uut(.A(A), .B(B), .R(R));

// Iterate over all possible 8-bit values for A and B
integer i;
integer j;

// Open a file for writing
integer file_id,file_id1;

initial begin
    
    file_id = $fopen("output4.txt", "w");
    file_id1 = $fopen("output5.txt", "w");
    if (file_id == 0) begin
        $display("Error opening file for writing");
        $finish;
    end
    
    $dumpfile("array_combine_88_tb.vcd");
    $dumpvars(0, array_combine_88_tb);
    

    for (i = 0; i < 256; i = i + 1) begin
        for (j = 0; j < 256; j = j + 1) begin
            A = i;
            B = j;
            #10; // Delay for simulation purposes
            
            // Write A, B, and R to the file
            $fdisplay(file_id, "A = %d, B = %d, R = %d", A, B, R);
            $fdisplay(file_id1,"%d", R);
        end
    end
    
    // Close the file
    $fclose(file_id);
    $fclose(file_id1);
    
    // Finish simulation after all iterations
    $finish;
end

endmodule


