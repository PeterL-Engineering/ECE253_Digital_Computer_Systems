module FA(
    input logic a, b, c_in,
    output logic s, c_out
);
    logic CONNECTION_1, CONNECTION_2;
    
    assign CONNECTION_1 = a ^ b;              // XOR of a and b
    assign s = CONNECTION_1 ^ c_in;           // Sum output
    
    always_comb begin
        case(CONNECTION_1)
            1'b0: c_out = b;
            1'b1: c_out = c_in;
            default: c_out = 1'b0;
        endcase
    end
    
endmodule