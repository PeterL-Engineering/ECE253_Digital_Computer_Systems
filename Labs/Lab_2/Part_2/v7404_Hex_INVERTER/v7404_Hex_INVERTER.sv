module v7404_Hex_INVERTER
    (
        input logic i_pin1, i_pin3, i_pin5, i_pin9, i_pin11, i_pin13,
        output logic o_pin2, o_pin4, o_pin6, o_pin8, o_pin10, o_pin12
    );

    // Gate 1: Input on pin 1, Output on pin 2
    inverter u0(
        .i_x(i_pin1),
        .o_m(o_pin2)
    );

    // Gate 2: Input on pin 3, Output on pin 4
    inverter u1(
        .i_x(i_pin3),
        .o_m(o_pin4)
    );

    // Gate 3: Input on pin 5, Output on pin 6
    inverter u2(
        .i_x(i_pin5),
        .o_m(o_pin6)
    );

    // Gate 4: Input on pin 9, Output on pin 8
    inverter u3(
        .i_x(i_pin9),
        .o_m(o_pin8)
    );

    // Gate 5: Input on pin 11, Output on pin 10
    inverter u4(
        .i_x(i_pin11),
        .o_m(o_pin10)
    );

    // Gate 6: Input on pin 13, Output on pin 12
    inverter u5(
        .i_x(i_pin13),
        .o_m(o_pin12)
    );

endmodule

module inverter
    (
        input logic i_x,
        output logic o_m
    );

    assign o_m = ~i_x;

endmodule