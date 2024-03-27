module FA(sum,cout,a,b,cin);

    input a,b,cin;
    output sum,cout;

    assign sum=(a^b^cin);
    assign cout= (a&b)|(b&cin)|(a&cin);

endmodule

module PP(pc,c,d);

    input c,d;
    output pc;

    assign pc= c&d;

endmodule

module Arraymul_eight_eight (
    input [7:0]A,B,
    output [15:0] R 
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

    FA FA11(s[0],c[0],(A[0]&B[1]),pp[1],1'b0);
    FA FA12(s[1],c[1],(A[1]&B[1]),pp[2],c[0]);
    FA FA13(s[2],c[2],(A[2]&B[1]),pp[3],c[1]);
    FA FA14(s[3],c[3],(A[3]&B[1]),pp[4],c[2]);
    FA FA15(s[4],c[4],(A[4]&B[1]),pp[5],c[3]);
    FA FA16(s[5],c[5],(A[5]&B[1]),pp[6],c[4]);
    FA FA17(s[6],c[6],(A[6]&B[1]),pp[7],c[5]);
    FA FA18(s[7],c[7],(A[7]&B[1]),1'b0,c[6]);

    //row2
    FA FA21(s[8],c[8],(A[0]&B[2]),s[1],1'b0);
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


    //row4
    FA FA41(s[24],c[24],(A[0]&B[4]),s[17],1'b0);
    FA FA42(s[25],c[25],(A[1]&B[4]),s[18],c[24]);
    FA FA43(s[26],c[26],(A[2]&B[4]),s[19],c[25]);
    FA FA44(s[27],c[27],(A[3]&B[4]),s[20],c[26]);
    FA FA45(s[28],c[28],(A[4]&B[4]),s[21],c[27]);
    FA FA46(s[29],c[29],(A[5]&B[4]),s[22],c[28]);
    FA FA47(s[30],c[30],(A[6]&B[4]),s[23],c[29]);
    FA FA48(s[31],c[31],(A[7]&B[4]),c[23],c[30]);

    //row5
    FA FA51(s[32],c[32],(A[0]&B[5]),s[25],1'b0);
    FA FA52(s[33],c[33],(A[1]&B[5]),s[26],c[32]);
    FA FA53(s[34],c[34],(A[2]&B[5]),s[27],c[33]);
    FA FA54(s[35],c[35],(A[3]&B[5]),s[28],c[34]);
    FA FA55(s[36],c[36],(A[4]&B[5]),s[29],c[35]);
    FA FA56(s[37],c[37],(A[5]&B[5]),s[30],c[36]);
    FA FA57(s[38],c[38],(A[6]&B[5]),s[31],c[37]);
    FA FA58(s[39],c[39],(A[7]&B[5]),c[31],c[38]);

   //row6
    FA FA61(s[40],c[40],(A[0]&B[6]),s[33],1'b0);
    FA FA62(s[41],c[41],(A[1]&B[6]),s[34],c[40]);
    FA FA63(s[42],c[42],(A[2]&B[6]),s[35],c[41]);
    FA FA64(s[43],c[43],(A[3]&B[6]),s[36],c[42]);
    FA FA65(s[44],c[44],(A[4]&B[6]),s[37],c[43]);
    FA FA66(s[45],c[45],(A[5]&B[6]),s[38],c[44]);
    FA FA67(s[46],c[46],(A[6]&B[6]),s[39],c[45]);
    FA FA68(s[47],c[47],(A[7]&B[6]),c[39],c[46]);

    //row6
    FA FA71(s[48],c[48],(A[0]&B[7]),s[41],1'b0);
    FA FA72(s[49],c[49],(A[1]&B[7]),s[42],c[48]);
    FA FA73(s[50],c[50],(A[2]&B[7]),s[43],c[49]);
    FA FA74(s[51],c[51],(A[3]&B[7]),s[44],c[50]);
    FA FA75(s[52],c[52],(A[4]&B[7]),s[45],c[51]);
    FA FA76(s[53],c[53],(A[5]&B[7]),s[46],c[52]);
    FA FA77(s[54],c[54],(A[6]&B[7]),s[47],c[53]);
    FA FA78(s[55],c[55],(A[7]&B[7]),c[47],c[54]);

    assign R[0] = pp[0];
    assign R[1] = s[0];
    assign R[2] = s[8];
    assign R[3] = s[16];
    assign R[4] = s[24];
    assign R[5] = s[32];
    assign R[6] = s[40];
    assign R[7] = s[48];
    assign R[8] = s[49];
    assign R[9] = s[50];
    assign R[10] = s[51];
    assign R[11] = s[52];
    assign R[12] = s[53];
    assign R[13] = s[54];
    assign R[14] = s[55];
    assign R[15] = c[55];

    
endmodule