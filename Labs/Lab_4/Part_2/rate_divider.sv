module RateDivider
#(parameter CLOCK_FREQUENCY=500)(
    input logic ClockIn,
    input logic Reset,
    input logic [1:0] Speed,
    output logic Enable
);