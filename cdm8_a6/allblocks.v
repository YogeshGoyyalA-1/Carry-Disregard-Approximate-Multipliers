module PP(pc,c,d);

    input c,d;
    output pc;
    assign pc= c&d;

endmodule

module pi0(sout,cout,a,b,cin);

    input a,b,cin;
    output sout,cout;

    assign sout=(a^b^cin);
    assign cout= (a&b)|(b&cin)|(a&cin);

endmodule

module HA(sum,carry,a,b);

    input a,b;
    output sum,carry;

    assign sum = a ^ b;  // Sum is the XOR of A and B
    assign carry = a & b;  // Carry is the AND of A and B

endmodule

module FA(sum,carry,a,b,cin);

    input a,b,cin;
    output sum,carry;

    assign sum = a ^ b ^ cin;  // Sum is the XOR of A and B
    assign carry = (a & b) | (b & cin) | (a & cin) ;  // Carry is the AND of A and B

endmodule

    
/////////////////

module pi1(sout,a,b,sin);

    input a,b,sin;
    output sout;

    assign sout= sin ^ (a & b);

endmodule

module pi2(sout,cout,a,b,sin);

    input a,b,sin;
    output sout,cout;

    HA HA00(sout,cout,sin,(a&b));

endmodule

module pi3(sout,cout,ai,aj,bi,bj,sin);

    input ai,aj,bi,bj,sin;
    output sout,cout;

    FA FA00(sout,cout,sin,(ai&bi),(aj&bj));

endmodule