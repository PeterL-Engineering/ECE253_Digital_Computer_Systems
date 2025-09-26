module part2(
    input logic [3:0] A, B, 
    input logic [1:0] Function,
    output logic [7:0] ALUout
);

    logic RCA_C_OUT;
    logic [3:0] RCA_S;

    RCA u0(
        .a(A),
        .b(B),
        .c_in(1'b0),
        .c_out(RCA_C_OUT),
        .s(RCA_S)
    );

    always_comb 
    begin
        case(Function)
            2'b00: ALUout = {3'b000, RCA_C_OUT, RCA_S}; // 4-bit addition result extended to 8 bits
            2'b01: ALUout = (|{A, B}) ? 8'b00000001 : 8'b00000000; // OR reduction of all 8 bits
            2'b10: ALUout = (&{A, B}) ? 8'b00000001 : 8'b00000000; // AND reduction of all 8 bits
            2'b11: ALUout = {A, B}; // Concatenate A and B into 8-bit signal
            default: ALUout = 8'b00000000;
        endcase
    end

endmodule