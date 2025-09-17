`include "v7404_Hex_INVERTER.sv"
`include "v7408_Quad_2_Input_AND.sv"
`include "v7432_Quad_2_Input_OR.sv"

module mux2to1
(
    input logic i_x, i_y, i_s,
    output logic o_m
);

    logic CONNECTION_1;
    logic CONNECTION_2;
    logic NOT_S;

    // Use v7404 to invert input s
    v7404_Hex_INVERTER u_inverter(
        .i_pin1(i_s),
        .o_pin2(NOT_S)
    );

    // First AND: i_x & ~i_s
    v7408_Quad_2_Input_AND u_and1(
        .i_pin1(i_x),      
        .i_pin2(NOT_S),     
        .o_pin3(CONNECTION_1)  
    );

    // Second AND: i_y & i_s  
    v7408_Quad_2_Input_AND u_and2(
        .i_pin4(i_y),       
        .i_pin5(i_s),      
        .o_pin6(CONNECTION_2)  
    );

    // OR gate: (i_x & ~i_s) | (i_y & i_s)
    v7432_Quad_2_Input_OR u_or(
        .i_pin1(CONNECTION_1),  
        .i_pin2(CONNECTION_2),  
        .o_pin3(o_m)           
    );

endmodule