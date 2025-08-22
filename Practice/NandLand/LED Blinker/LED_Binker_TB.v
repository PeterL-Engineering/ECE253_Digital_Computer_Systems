`include "LED_Blinker.v"
`timescale 1us/1ns

module LED_Blinker_TB;

    reg r_CLOCK    = 1'b0;
    reg r_ENABLE   = 1'b0;
    reg r_SWITCH_1 = 1'b0;
    reg r_SWITCH_2 = 1'b0;

    wire w_LED_DRIVE;

    // Instantiate the Unit Under Test (UUT)
    LED_Blinker UUT
        (
            .i_clock(r_CLOCK),
            .i_enable(r_ENABLE),
            .i_switch_1(r_SWITCH_1),
            .i_switch_2(r_SWITCH_2),
            .o_led_drive(w_LED_DRIVE)
        );

    always #20 r_CLOCK <= !r_CLOCK;

    initial begin
        r_ENABLE <= 1'b1;

        r_SWITCH_1 <= 1'b0;
        r_SWITCH_2 <= 1'b;
        #200000 // 0.2 seconds

        r_SWITCH_1 <= 1'b0;
        r_SWITCH_2 <= 1'b1;
        #200000 // 0.2 seconds

        r_SWITCH_1 <= 1'b1;
        r_SWITCH_2 <= 1'b0;
        #500000 // 0.5 seconds

        r_SWITCH_1 <= 1'b1;
        r_SWITCH_2 <= 1'b1;
        #2000000 // 2 seconds

        $display("Test Complete");
    end

endmodule        