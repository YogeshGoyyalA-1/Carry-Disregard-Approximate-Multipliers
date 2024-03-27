// module FA(sum,cout,a,b,cin);

//     input a,b,cin;
//     output sum,cout;

//     assign sum=(a^b^cin);
//     assign cout= (a&b)|(b&cin)|(a&cin);

// endmodule

// module PP(pc,c,d);

//     input c,d;
//     output pc;

//     assign pc= c&d;

// endmodule

module cd2(
    input [7:0]A,
    input [3:0]B,
    output [11:0] R 
);

    wire [64:0]s,c;   //for sum and carry bits
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

    //FA FA11(s[0],c[0],(A[0]&B[1]),pp[1],1'b0);
    pi1 pi111(s[0],A[0],B[1],pp[1]); // sout,a,b,sin
    //FA FA12(s[1],c[1],(A[1]&B[1]),pp[2],c[0]);
    //FA FA13(s[2],c[2],(A[2]&B[1]),pp[3],c[1]);
    pi2 pi216(s[2],c[2],A[2],B[1],pp[3]);
    FA FA14(s[3],c[3],(A[3]&B[1]),pp[4],c[2]);
    FA FA15(s[4],c[4],(A[4]&B[1]),pp[5],c[3]);
    FA FA16(s[5],c[5],(A[5]&B[1]),pp[6],c[4]);
    FA FA17(s[6],c[6],(A[6]&B[1]),pp[7],c[5]);
    FA FA18(s[7],c[7],(A[7]&B[1]),1'b0,c[6]);

    //row2
    //FA FA21(s[8],c[8],(A[0]&B[2]),s[1],1'b0);
    pi3 pi3125(s[8],c[8],A[1],A[0],B[1],B[2],pp[2]);
    FA FA22(s[9],c[9],(A[1]&B[2]),s[2],c[8]);
    FA FA23(s[10],c[10],(A[2]&B[2]),s[3],c[9]);
    FA FA24(s[11],c[11],(A[3]&B[2]),s[4],c[10]);
    FA FA25(s[12],c[12],(A[4]&B[2]),s[5],c[11]);
    FA FA26(s[13],c[13],(A[5]&B[2]),s[6],c[12]);
    FA FA27(s[14],c[14],(A[6]&B[2]),s[7],c[13]);
    FA FA28(s[15],c[15],(A[7]&B[2]),c[7],c[14]);

    //row3
    FA FA31(s[16],c[16],(A[0]&B[3]),s[9],1'b0);
    FA FA32(s[17],c[17],(A[1]&B[3]),s[10],c[16]);
    FA FA33(s[18],c[18],(A[2]&B[3]),s[11],c[17]);
    FA FA34(s[19],c[19],(A[3]&B[3]),s[12],c[18]);
    FA FA35(s[20],c[20],(A[4]&B[3]),s[13],c[19]);
    FA FA36(s[21],c[21],(A[5]&B[3]),s[14],c[20]);
    FA FA37(s[22],c[22],(A[6]&B[3]),s[15],c[21]);
    FA FA38(s[23],c[23],(A[7]&B[3]),c[15],c[22]);

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
    assign R[11] = c[23];

endmodule