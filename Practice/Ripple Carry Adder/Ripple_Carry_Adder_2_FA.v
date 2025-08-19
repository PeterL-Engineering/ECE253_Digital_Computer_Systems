`include "Full_Adder.v"

module ripple_carry_adder_2_FA
    (
        input [1:0] i_add_term1,
        input [1:0] i_add_term2,
        output[2:0] o_result
    );

    wire [2:0]      w_CARRY;
    wire [1:0]      w_SUM;

    // No carry input on first full adder

    full_adder full_adder_1
        (
            .i_bit1(i_add_term1[0]),
            .i_bit2(i_add_term2[0]),
            .i_carry(w_CARRY[0]),
            .o_sum(w_SUM[0]),
            .o_carry(w_CARRY[1])
        );

    full_adder full_adder_2
        (
            .i_bit1(i_add_term1[1]),
            .i_bit2(i_add_term2[1]),
            .i_carry(w_CARRY[1]),
            .o_sum(w_SUM[1]),
            .o_carry(w_CARRY[2])
        );

    assign o_result = {w_CARRY[2], w_SUM}; // Verilog Concatenation

endmodule // ripple_carry_adder_2_FA
