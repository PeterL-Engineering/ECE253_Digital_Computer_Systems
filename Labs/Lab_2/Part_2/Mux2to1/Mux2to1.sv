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

    // Use v7404 to invert input s
    v7404_Hex_INVERTER u_inverter(
        .i_pin1(s),
        .o_pin2(NOT_S)
    );

    // First AND: x & ~s
    v7408_Quad_2_Input_AND u_and1(
        .i_pin1(x),      
        .i_pin2(NOT_S),     
        .o_pin3(CONNECTION_1)  
    );

    // Second AND: y & s  
    v7408_Quad_2_Input_AND u_and2(
        .i_pin4(y),       
        .i_pin5(s),      
        .o_pin6(CONNECTION_2)  
    );

    // OR gate: (x & ~s) | (y & s)
    v7432_Quad_2_Input_OR u_or(
        .i_pin1(CONNECTION_1),  
        .i_pin2(CONNECTION_2),  
        .o_pin3(m)           
    );

endmodule