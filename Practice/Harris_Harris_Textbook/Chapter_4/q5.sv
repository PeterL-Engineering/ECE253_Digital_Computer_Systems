module minority(
    input logic a, b, c,
    output logic y
);

    logic CONNECTION_1;
    logic CONNECTION_2;
    logic CONNECTION_3;

    assign CONNECTION_1 = ~a & ~b;
    assign CONNECTION_2 = ~a & ~c;
    assign CONNECTION_3 = ~b & ~c;

    assign y = CONNECTION_1 | CONNECTION_2 | CONNECTION_3;

endmodule