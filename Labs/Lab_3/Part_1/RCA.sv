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