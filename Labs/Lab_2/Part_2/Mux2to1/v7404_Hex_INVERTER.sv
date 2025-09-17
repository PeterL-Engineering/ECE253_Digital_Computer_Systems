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