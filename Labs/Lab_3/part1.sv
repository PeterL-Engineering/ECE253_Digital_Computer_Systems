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

module part1(
    input logic [3:0] a, b,
    input logic c_in,
    output logic [3:0] s, c_out
);

    logic CARRY_1;
    logic CARRY_2;
    logic CARRY_3;

    // Full Adder for bit 0 
    FA u0 (
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),        // External carry-in
        .c_out(c_out[0]),
        .s(s[0])
    );

    // Full Adder for bit 1
    FA u1 (
        .a(a[1]),
        .b(b[1]),
        .c_in(c_out[0]),     // Carry from previous stage
        .c_out(c_out[1]),
        .s(s[1])
    );

    // Full Adder for bit 2
    FA u2 (
        .a(a[2]),
        .b(b[2]),
        .c_in(c_out[1]),     // Carry from previous stage
        .c_out(c_out[2]),
        .s(s[2])
    );

    // Full Adder for bit 3 
    FA u3 (
        .a(a[3]),
        .b(b[3]),
        .c_in(c_out[2]),     // Carry from previous stage
        .c_out(c_out[3]),      // Final carry-out
        .s(s[3])
    );

endmodule