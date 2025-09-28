module D_flip_flop(
    input logic clk,
    input logic reset_b, 
    input logic [7:0] d,  // Changed to 8-bit to match ALU output
    output logic [7:0] q  // Changed to 8-bit
);

    always_ff @(posedge clk)
    begin
        if (!reset_b) 
            q <= 8'b00000000;
        else 
            q <= d;
    end

endmodule

module part3(
    input logic Clock,
    input logic Reset_b,
    input logic [3:0] Data,
    input logic [2:0] Function,
    output logic [7:0] ALU_reg_out
);

    logic [7:0] ALUout;
    logic [7:0] REGISTER_OUTPUT;  // Connection between flip-flop and ALU

    // ALU combinational logic
    always_comb
    begin
        case(Function)
            2'b00: ALUout = {4'b0000, Data} + REGISTER_OUTPUT;  // Extend Data to 8 bits
            2'b01: ALUout = {4'b0000, Data} * REGISTER_OUTPUT;  // Multiplication
            2'b10: ALUout = REGISTER_OUTPUT << Data;  // Left shift by Data bits
            2'b11: ALUout = {4'b0000, Data};  // Extend Data to 8 bits
            default: ALUout = 8'b00000000;            
        endcase
    end

    // D flip-flop instance
    D_flip_flop u0(
        .clk(Clock),
        .reset_b(Reset_b),
        .d(ALUout),        // Input to flip-flop comes from ALU
        .q(REGISTER_OUTPUT) // Output from flip-flop goes back to ALU
    );

    // Output assignment
    assign ALU_reg_out = REGISTER_OUTPUT;

endmodule