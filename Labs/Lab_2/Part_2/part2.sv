module v7404 
(
    input logic pin1, pin3, pin5, pin9, pin11, pin13,
    output logic pin2, pin4, pin6, pin8, pin10, pin12
);

    // Gate 1: Input on pin 1, Output on pin 2
    inverter u0(
        .x(pin1),
        .m(pin2)
    );

    // Gate 2: Input on pin 3, Output on pin 4
    inverter u1(
        .x(pin3),
        .m(pin4)
    );

    // Gate 3: Input on pin 5, Output on pin 6
    inverter u2(
        .x(pin5),
        .m(pin6)
    );

    // Gate 4: Input on pin 9, Output on pin 8
    inverter u3(
        .x(pin9),
        .m(pin8)
    );

    // Gate 5: Input on pin 11, Output on pin 10
    inverter u4(
        .x(pin11),
        .m(pin10)
    );

    // Gate 6: Input on pin 13, Output on pin 12
    inverter u5(
        .x(pin13),
        .m(pin12)
    );

endmodule

module inverter
(
    input logic x,
    output logic m
);
    assign m = ~x;
endmodule

module v7408 
(
    input logic pin1, 
    output logic pin3, 
    input logic pin5, 
    input logic pin9, 
    output logic pin11, 
    input logic pin13, 
    input logic pin2, 
    input logic pin4, 
    output logic pin6, 
    output logic pin8, 
    input logic pin10, 
    input logic pin12
);

    // Gate 1: Inputs on pins 1 & 2, Output on pin 3
    and_gate u0(
        .x(pin1),
        .y(pin2),
        .m(pin3)
    );

    // Gate 2: Inputs on pins 4 & 5, Output on pin 6
    and_gate u1(
        .x(pin4),
        .y(pin5),
        .m(pin6)
    );

    // Gate 3: Inputs on pins 9 & 10, Output on pin 8
    and_gate u2(
        .x(pin9),
        .y(pin10),
        .m(pin8)
    );

    // Gate 4: Inputs on pins 12 & 13, Output on pin 11
    and_gate u3(
        .x(pin12),
        .y(pin13),
        .m(pin11)
    );

endmodule

module and_gate
(
    input logic x,
    input logic y,
    output logic m
);
    assign m = x & y;
endmodule

module v7432 (
    input logic pin1, 
    output logic pin3, 
    input logic pin5, 
    input logic pin9, 
    output logic pin11, 
    input logic pin13, 
    input logic pin2, 
    input logic pin4, 
    output logic pin6, 
    output logic pin8, 
    input logic pin10, 
    input logic pin12
);

    // Gate 1: Inputs on pins 1 & 2, Output on pin 3
    or_gate u0(
        .x(pin1),
        .y(pin2),
        .m(pin3)
    );

    // Gate 2: Inputs on pins 4 & 5, Output on pin 6
    or_gate u1(
        .x(pin4),
        .y(pin5),
        .m(pin6)
    );

    // Gate 3: Inputs on pins 9 & 10, Output on pin 8
    or_gate u2(
        .x(pin9),
        .y(pin10),
        .m(pin8)
    );

    // Gate 4: Inputs on pins 12 & 13, Output on pin 11
    or_gate u3(
        .x(pin12),
        .y(pin13),
        .m(pin11)
    );

endmodule

module or_gate (
    input logic x,
    input logic y,
    output logic m
);
    assign m = x | y;
endmodule

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