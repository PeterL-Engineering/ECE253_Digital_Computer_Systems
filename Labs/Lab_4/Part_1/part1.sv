`include "D_FF.sv"

module part1(
    input logic clock, 
    input logic reset, 
    input logic ParallelLoadn, 
    input logic RotateRight, 
    input logic ASRight,
    input logic [3:0] Data_IN,
    output logic [3:0] Q
);
    logic [3:0] LOAD, ROTATE_OUT;
    logic ASR_CLOCK;  

    // Mux for loading vs rotate modes
    always_comb begin
        case (ParallelLoadn)
            1'b0: LOAD = Data_IN;      // Parallel load
            1'b1: LOAD = ROTATE_OUT;   // Rotate mode 
            default: LOAD = 4'b0000;   // Safe default
        endcase
    end

    // Rotate/Shift logic
    always_comb begin
        if (ASRight) begin
            // Arithmetic Shift Right - preserve sign bit (MSB = Q[3])
            ROTATE_OUT = {Q[3], Q[3:1]};  // Sign extend MSB
        end else if (RotateRight) begin
            // Right Rotate
            ROTATE_OUT = {Q[0], Q[3:1]};  // LSB wraps to MSB
        end else begin
            // Left Rotate  
            ROTATE_OUT = {Q[2:0], Q[3]};  // MSB wraps to LSB
        end
    end

    // Clock gating for ASR (freezes leftmost flip-flop Q[3])
    always_comb begin
        ASR_CLOCK = ASRight ? 1'b0 : clock;
    end

    // Q[3] is leftmost (MSB), Q[0] is rightmost (LSB)
    D_FF u3(
        .clk(ASR_CLOCK),  // Leftmost FF - frozen during ASR
        .reset_b(reset),
        .d(LOAD[3]),      // MSB
        .q(Q[3]) 
    );
    
    D_FF u2(
        .clk(clock),
        .reset_b(reset),
        .d(LOAD[2]),      
        .q(Q[2]) 
    );
    
    D_FF u1(
        .clk(clock),
        .reset_b(reset),
        .d(LOAD[1]),      
        .q(Q[1]) 
    );
    
    D_FF u0(
        .clk(clock),
        .reset_b(reset),
        .d(LOAD[0]),      // LSB
        .q(Q[0]) 
    );
    
endmodule