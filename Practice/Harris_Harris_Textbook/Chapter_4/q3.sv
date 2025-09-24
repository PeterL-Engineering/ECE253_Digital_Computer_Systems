module four_in_XOR(
    input logic [3:0] a,
    output logic y
);
    logic CONNECTION_1, CONNECTION_2;
    
    assign CONNECTION_1 = a[0] ^ a[1];      // XOR of first two bits
    assign CONNECTION_2 = a[2] ^ a[3];      // XOR of last two bits
    assign y = CONNECTION_1 ^ CONNECTION_2; // XOR of the results
    
endmodule