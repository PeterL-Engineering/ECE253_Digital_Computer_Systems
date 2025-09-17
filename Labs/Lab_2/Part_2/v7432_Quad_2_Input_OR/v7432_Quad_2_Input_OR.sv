module v7432_Quad_2_input_OR (
    input logic i_pin1, i_pin2, i_pin4, i_pin5, i_pin9, i_pin10, i_pin12, i_pin13,
    output logic o_pin3, o_pin6, o_pin8, o_pin11
);

    // Gate 1: Inputs on pins 1 & 2, Output on pin 3
    or_gate u0(
        .i_x(i_pin1),
        .i_y(i_pin2),
        .o_m(o_pin3)
    );

    // Gate 2: Inputs on pins 4 & 5, Output on pin 6
    or_gate u1(
        .i_x(i_pin4),
        .i_y(i_pin5),
        .o_m(o_pin6)
    );

    // Gate 3: Inputs on pins 9 & 10, Output on pin 8
    or_gate u2(
        .i_x(i_pin9),
        .i_y(i_pin10),
        .o_m(o_pin8)
    );

    // Gate 4: Inputs on pins 12 & 13, Output on pin 11
    or_gate u3(
        .i_x(i_pin12),
        .i_y(i_pin13),
        .o_m(o_pin11)
    );

endmodule

module or_gate (
    input logic i_x,
    input logic i_y,
    output logic o_m
);
    assign o_m = i_x | i_y;
endmodule