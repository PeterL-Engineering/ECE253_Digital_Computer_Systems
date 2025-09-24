module 8to1mux(
    input logic [2:0] s,
    input logic d0, d1, d2, d3, d4, d5, d6, d7,
    output logic y
);

    always_comb
    begin
        case(s)
            3'b000: y = d0; // Case 0
            3'b001: y = d1; // Case 1
            3'b010: y = d2; // Case 2
            3'b011: y = d3; // Case 3
            3'b100: y = d4; // Case 4
            3'b101: y = d5; // Case 5
            3'b110: y = d6; // Case 6
            3'b111: y = d7; // Case 7
            default: y = 0; // Default case set arbitrarily
        endcase
    end

endmodule