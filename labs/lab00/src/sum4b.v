`include "sum1b.v"

module sum4b (
    input [3:0] A,
    input [3:0] B,
    input Ci,
    output [3:0] S, 
    output  Co
);

wire C0;
wire C1;
wire C2;

sum1b bit0(.A(A[0]), .B(B[0]), .Ci(1'b0), .S(S[0]), .Co(C0));
sum1b bit1(.A(A[1]), .B(B[1]), .Ci(C0), .S(S[1]), .Co(C1));
sum1b bit2(.A(A[2]), .B(B[2]), .Ci(C1), .S(S[2]), .Co(C2));
sum1b bit3(.A(A[3]), .B(B[3]), .Ci(C2), .S(S[3]), .Co(Co));
    
endmodule