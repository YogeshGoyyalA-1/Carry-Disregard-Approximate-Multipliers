`timescale 1ns/1ns
`include "cla_sixteen.v"

module cla_sixteen_tb;

reg [15:0] A, B;
reg Cin;
wire [15:0] S;
wire Cout;

cla_sixteen uut(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

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
    
    $dumpfile("cla_sixteen_tb.vcd");
    $dumpvars(0, cla_sixteen_tb);
    
    Cin=1'b0;
    for (i = 0; i < 20; i = i + 1) begin
        for (j = 0; j < 20; j = j + 1) begin
            A = i;
            B = j;
            #10; // Delay for simulation purposes
            
            // Write A, B, and R to the file
            $fdisplay(file_id, "A = %d, B = %d, S = %d", A, B, S);
        end
    end
    
    // Close the file
    $fclose(file_id);
    
    // Finish simulation after all iterations
    $finish;
end

endmodule


