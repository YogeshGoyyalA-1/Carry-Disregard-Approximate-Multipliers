module FullAdder(Sum, Carry, x, y, z);
  input x, y, z;
  output Sum, Carry;
  wire s1, d1, d2;
  
  xor g1(s1, x, y);
  and g2(d1, x, y);
  and g3(d2, z, s1);
  xor g4(Sum, z, s1);
  or g5(Carry, d1, d2);
endmodule

module CLA(S, Cout, A, B, Cin);
  input [3:0] A;
  input [3:0] B; 
  input Cin;
  output Cout; 
  output [3:0] S;
  wire [3:1] C;
  wire [0:3] P; 
  wire [0:3] G;
  
  // Making Ps
  xor p0(P[0], A[0], B[0]);
  xor p1(P[1], A[1], B[1]);
  xor p2(P[2], A[2], B[2]);
  xor p3(P[3], A[3], B[3]);
  
  // Making Gs 
  and g0(G[0], A[0], B[0]);
  and g1(G[1], A[1], B[1]);
  and g2(G[2], A[2], B[2]);
  and g3(G[3], A[3], B[3]);
  
  // Making C1
  wire tmp1;
  and c11(tmp1, P[0], Cin);
  or c12(C[1], G[0], tmp1);
  
  // Making C2
  wire tmp2;
  wire tmp3;
  and c21(tmp2, P[1], G[0]);
  and c22(tmp3, P[1], P[0], Cin);
  or c23(C[2], tmp2, tmp3, G[1]);
  
  // Making C3
  wire tmp4;
  wire tmp5;
  wire tmp6;
  and c31(tmp4, P[2], G[1]);
  and c32(tmp5, P[2], P[1], G[0]);
  and c33(tmp6, P[2], P[1], P[0], Cin);
  or c34(C[3], tmp4, tmp5, tmp6, G[2]);
  
  // Making Cout (C4)
  wire tmp7;
  wire tmp8;
  wire tmp9;
  wire tmp10;
  and c41(tmp7, P[3], G[2]);
  and c42(tmp8, P[3], P[2], G[1]);
  and c43(tmp9, P[3], P[2], P[1], G[0]);
  and c44(tmp10, P[3], P[2], P[1], P[0], Cin);
  or c45(Cout, tmp7, tmp8, tmp9, tmp10, G[3]);
  
  // Making Sums
  xor s0(S[0], P[0], Cin);
  xor s1(S[1], P[1], C[1]);
  xor s2(S[2], P[2], C[2]);
  xor s3(S[3], P[3], C[3]);
  
endmodule

module cla_sixteen(A,B,Cin,S,Cout); 
  input [15:0]A; 
  input [15:0]B; 
  input Cin; 
  output [15:0]S; 
  output Cout;   
  wire [3:1]C;
  
  CLA F0_3 (S[3:0] , C[1] , A[3:0] , B[3:0] , Cin);
  CLA F4_7 (S[7:4] , C[2] , A[7:4] , B[7:4] , C[1]);
  CLA F8_11 (S[11:8] , C[3] , A[11:8] , B[11:8] , C[2]);
  CLA F12_15 (S[15:12] , Cout , A[15:12] , B[15:12] , C[3]);
  
  
endmodule