`timescale 1ns/1ns
`include "cdm16_ffff.v"

module cdm16_ffff_tb;

reg [15:0] A, B;
wire [31:0] R;

cdm16_ffff uut(.A(A), .B(B), .R(R));

// Iterate over all possible 8-bit values for A and B
integer i;
integer j;

// Open a file for writing
integer file_id,file_id1,file_id2;

initial begin
    
    file_id = $fopen("output.txt", "w");
    file_id1 = $fopen("output1.txt", "w");
    file_id2 = $fopen("output2.txt", "w");
    if (file_id == 0) begin
        $display("Error opening file for writing");
        $finish;
    end
    
    $dumpfile("cdm16_ffff.vcd");
    $dumpvars(0, uut);
    

    // for (i = 0; i < 65536; i = i + 1) begin
    //     for (j = 0; j < 256; j = j + 1) begin
    //         A = i;
    //         B = j;
    //         #10; // Delay for simulation purposes
            
    //         // Write A, B, and R to the file
    //         $fdisplay(file_id, "A = %d, B = %d, R = %d", A, B, R);
    //         $fdisplay(file_id1, "%d", R);
    //     end
    // end
    for (i = 0; i < 1000000; i = i + 1) begin
      // Generate two 16-bit random numbers
      A = $random % 65536; // 2^16 = 65536
      B = $random % 65536; // 2^16 = 65536
      #20;

      // $fdisplay(file_id, "A = %d, B = %d, R = %d", A, B, R);
      // $fdisplay(file_id1, "A = %d, B = %d, R = %d", A, B, A*B);

      $fdisplay(file_id, A);
      $fdisplay(file_id1, B);
      $fdisplay(file_id2, R);
      // $fdisplay(file_id1, "A = %d, B = %d, R = %d", A, B, A*B);
    //         $fdisplay(file_id1, "%d", R);
      // Display the random numbers
      //$display("Iteration %d: Random number 1: %d, Random number 2: %d", i, random_number1, random_number2);
    end
    
    // Close the file
    $fclose(file_id);
    $fclose(file_id1);
    $fclose(file_id2);
    
    // Finish simulation after all iterations
    $finish;
end

endmodule