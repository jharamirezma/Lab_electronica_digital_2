module sum1b(
    input A,
    input B,
    input Ci,
    output S,
    output Co
);

wire xor1;
wire and1;
wire and2;

assign xor1 = A ^ B;
assign and1 = A & B;
assign and2 = Ci & xor1;
assign S = Ci ^ xor1;
assign Co =  and1 | and2;


endmodule