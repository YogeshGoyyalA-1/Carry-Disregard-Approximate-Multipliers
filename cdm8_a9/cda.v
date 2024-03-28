`include "allblocks.v"

// module PP(pc,c,d);

//     input c,d;
//     output pc;
//     assign pc= c&d;

// endmodule

// module pi0(sout,cout,a,b,cin);

//     input a,b,cin;
//     output sout,cout;

//     assign sout=(a^b^cin);
//     assign cout= (a&b)|(b&cin)|(a&cin);

// endmodule

// module HA(sum,carry,a,b);

//     input a,b;
//     output sum,carry;

//     assign sum = a ^ b;  // Sum is the XOR of A and B
//     assign carry = a & b;  // Carry is the AND of A and B

// endmodule

// module FA(sum,carry,a,b,cin);

//     input a,b,cin;
//     output sum,carry;

//     assign sum = a ^ b ^ cin;  // Sum is the XOR of A and B
//     assign carry = (a & b) | (b & cin) | (a & cin) ;  // Carry is the AND of A and B

// endmodule

    
// /////////////////

// module pi1(sout,a,b,sin);

//     input a,b,sin;
//     output sout;

//     assign sout= sin ^ (a & b);

// endmodule

// module pi2(sout,cout,a,b,sin);

//     input a,b,sin;
//     output sout,cout;

//     HA HA00(sout,cout,sin,(a&b));

// endmodule

// module pi3(sout,cout,ai,aj,bi,bj,sin);

//     input ai,aj,bi,bj,sin;
//     output sout,cout;

//     FA FA00(sout,cout,sin,(ai&bi),(aj&bj));

// endmodule

module cda (
    input [7:0]A,
    input [3:0]B,
    output [11:0] R 
);

    wire [64:0]s;   //for sum and carry bits
    wire [7:0]pp;    //for partial product calculation

    //row0 --- calculation of partial product block

    PP PP01(pp[0],A[0],B[0]);
    PP PP02(pp[1],A[1],B[0]);
    PP PP03(pp[2],A[2],B[0]);
    PP PP04(pp[3],A[3],B[0]);
    PP PP05(pp[4],A[4],B[0]);
    PP PP06(pp[5],A[5],B[0]);
    PP PP07(pp[6],A[6],B[0]);
    PP PP08(pp[7],A[7],B[0]);

    //row1

    //row1
    pi1 pi111(s[0],A[0],B[1],pp[1]); //
    pi1 pi112(s[1],A[1],B[1],pp[2]);
    pi1 pi113(s[2],A[2],B[1],pp[3]);
    pi1 pi114(s[3],A[3],B[1],pp[4]);
    pi1 pi115(s[4],A[4],B[1],pp[5]);
    pi1 pi116(s[5],A[5],B[1],pp[6]);
    pi1 pi117(s[6],A[6],B[1],pp[7]);
    pi1 pi118(s[7],A[7],B[1],1'b0);

    //row2
    pi1 pi121(s[8],A[0],B[2],s[1]);//
    pi1 pi122(s[9],A[1],B[2],s[2]);
    pi1 pi123(s[10],A[2],B[2],s[3]);
    pi1 pi124(s[11],A[3],B[2],s[4]);
    pi1 pi125(s[12],A[4],B[2],s[5]);
    pi1 pi126(s[13],A[5],B[2],s[6]);
    pi1 pi127(s[14],A[6],B[2],s[7]);
    pi1 pi128(s[15],A[7],B[2],1'b0);

    //row3
    pi1 pi131(s[16],A[0],B[3],s[9]);//
    pi1 pi132(s[17],A[1],B[3],s[10]);
    pi1 pi133(s[18],A[2],B[3],s[11]);
    pi1 pi134(s[19],A[3],B[3],s[12]);
    pi1 pi135(s[20],A[4],B[3],s[13]);
    pi1 pi136(s[21],A[5],B[3],s[14]);
    pi1 pi137(s[22],A[6],B[3],s[15]);
    pi1 pi138(s[23],A[7],B[3],1'b0);

    assign R[0] = pp[0];
    assign R[1] = s[0];
    assign R[2] = s[8];
    assign R[3] = s[16];
    assign R[4] = s[17];
    assign R[5] = s[18];
    assign R[6] = s[19];
    assign R[7] = s[20];
    assign R[8] = s[21];
    assign R[9] = s[22];
    assign R[10] = s[23];
    assign R[11] = 1'b0;


endmodule