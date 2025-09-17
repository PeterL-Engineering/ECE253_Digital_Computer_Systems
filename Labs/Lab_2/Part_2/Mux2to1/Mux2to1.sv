`include "v7404_Hex_INVERTER.sv"
`include "v7408_Quad_2_Input_AND.sv"
`include "v7432_Quad_2_Input_OR.sv"

module mux2to1
(
    input logic x, y, s,
    output logic m
);

    logic CONNECTION_1;
    logic CONNECTION_2;
    logic NOT_S;

    // Use v7404 to invert input s - ground unused inputs
    v7404 u_inverter(
        .pin1(s),
        .pin2(NOT_S),
        .pin3(1'b0),   // Ground unused inputs
        .pin5(1'b0),
        .pin9(1'b0),
        .pin11(1'b0),
        .pin13(1'b0)
        // Outputs left unconnected
    );

    // Use single 7408 for both AND operations
    // Gate 1: x & ~s
    // Gate 2: y & s
    v7408 u_and_chip(
        .pin1(x),           // Gate 1 input A
        .pin2(NOT_S),       // Gate 1 input B
        .pin3(CONNECTION_1),// Gate 1 output (x & ~s)
        .pin4(y),           // Gate 2 input A
        .pin5(s),           // Gate 2 input B
        .pin6(CONNECTION_2),// Gate 2 output (y & s)
        .pin9(1'b0),        // Ground unused gate inputs
        .pin10(1'b0),
        .pin8(),            // Unused output
        .pin12(1'b0),       // Ground unused gate inputs
        .pin13(1'b0),
        .pin11()            // Unused output
    );

    // OR gate: (x & ~s) | (y & s) - ground unused inputs
    v7432 u_or(
        .pin1(CONNECTION_1),  // Gate 1 input A
        .pin2(CONNECTION_2),  // Gate 1 input B
        .pin3(m),             // Gate 1 output
        .pin4(1'b0),          // Ground unused inputs
        .pin5(1'b0),
        .pin9(1'b0),
        .pin10(1'b0),
        .pin12(1'b0),
        .pin13(1'b0)
        // Outputs left unconnected
    );

endmodule