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

module RCA(
    input logic [3:0] a, b,
    input logic c_in,
    output logic [3:0] s,
    output logic c_out
);

    logic CARRY_1;
    logic CARRY_2;
    logic CARRY_3;

    // Full Adder for bit 0 
    FA u0 (
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),        // External carry-in
        .c_out(CARRY_1),
        .s(s[0])
    );

    // Full Adder for bit 1
    FA u1 (
        .a(a[1]),
        .b(b[1]),
        .c_in(CARRY_1),     // Carry from previous stage
        .c_out(CARRY_2),
        .s(s[1])
    );

    // Full Adder for bit 2
    FA u2 (
        .a(a[2]),
        .b(b[2]),
        .c_in(CARRY_2),     // Carry from previous stage
        .c_out(CARRY_3),
        .s(s[2])
    );

    // Full Adder for bit 3 
    FA u3 (
        .a(a[3]),
        .b(b[3]),
        .c_in(CARRY_3),     // Carry from previous stage
        .c_out(c_out),      // Final carry-out
        .s(s[3])
    );

endmodule

module FA(
    input logic a, b, c_in,
    output logic s, c_out
);
    logic CONNECTION_1, CONNECTION_2;
    
    assign CONNECTION_1 = a ^ b;              // XOR of a and b
    assign s = CONNECTION_1 ^ c_in;           // Sum output
    
    always_comb begin
        case(CONNECTION_1)
            1'b0: c_out = b;
            1'b1: c_out = c_in;
            default: c_out = 1'b0;
        endcase
    end
    
endmodule