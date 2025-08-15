module example_and_gate
(
    input_1,
    input_2,
    and_result
);

    input  input_1;
    input  input_2;
    output and_result;

    wire and_temp;

    assign and_temp   = input_1 & input_2;
    assign and_result = and_temp;

endmodule

// Combinational Logic Example

always @ (input_1 or input_2)
    begin
        and_gate = input_1 & input_2;
    end

// Sequential Logic Example
//      - Sequential meaning circuit is dependent on waveform
//      - This waveform is referred to as the clock

always @ (posedge i_clock)
    begin  
        and_gate <= input_1 & input_2;
    end

// Flip-Flop Chain Example
//      - The signal goes across the flip flops accordinging the waveform signal
//      - Flip flops send input signal to output when it receives waveform signal

reg test1 = 1'b1;
reg test2 = 1'b0;
reg test3 = 1'b0;
reg test4 = 1'b0;

always @ (posedge i_clock)
    begin
        test2 <= test1;
        test3 <= test2;
        test4 <= test3;
    end

    