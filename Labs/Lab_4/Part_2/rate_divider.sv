module RateDivider
#(parameter CLOCK_FREQUENCY=500)(
    input logic ClockIn,
    input logic Reset,
    input logic [1:0] Speed,
    output logic Enable
);

    // Calculate required bit width for the counter
    localparam COUNTER_WIDTH = $clog2(CLOCK_FREQUENCY * 4);
    
    logic [COUNTER_WIDTH-1:0] TARGET_COUNT; // Target clock cycles before pulse
    logic [COUNTER_WIDTH-1:0] RATE_DIV_COUNT; // Current countdown

    // Determine target count based on speed input
    always_comb
    begin
        case(Speed)
            2'b00: TARGET_COUNT = '0; // Full speed (every clock cycle)
            2'b01: TARGET_COUNT = CLOCK_FREQUENCY - 1; // 1 Hz 
            2'b10: TARGET_COUNT = (CLOCK_FREQUENCY * 2) - 1; // 0.5 Hz
            2'b11: TARGET_COUNT = (CLOCK_FREQUENCY * 4) - 1; // 0.25 Hz
        endcase
    end

    // Counter logic
    always_ff @(posedge ClockIn or posedge Reset)
    begin
        if (Reset) 
            RATE_DIV_COUNT <= TARGET_COUNT; // If reset high get new target
        else if (RATE_DIV_COUNT == '0)
            RATE_DIV_COUNT <= TARGET_COUNT; // If countdown = 0 get new target
        else
            RATE_DIV_COUNT <= RATE_DIV_COUNT - 1; // Countdown by 1
    end

    // Generate enable pulse when countdown reaches 0
    assign Enable = (RATE_DIV_COUNT == '0) ? 1'b1 : 1'b0;

endmodule