module D_FF
#(parameter WIDTH = 1)(
    input logic clk,
    input logic reset_b,     
    input logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);

    always_ff @(posedge clk)
    begin
        if (reset_b)         // Active-high reset condition
            q <= {WIDTH{1'b0}};
        else 
            q <= d;
    end

endmodule