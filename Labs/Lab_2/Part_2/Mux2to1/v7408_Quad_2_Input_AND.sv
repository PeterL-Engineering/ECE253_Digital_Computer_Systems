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