module DisplayCounter(
    input logic Clock,
    input logic Reset,
    input logic EnableDC,
    output logic [3:0] CounterValue
);

    always_ff @(posedge Clock or posedge Reset)
    begin
        if (Reset == 1'b1) // If reset high then countervalue = 0
            CounterValue <= 4'b0000; 
        else if (EnableDC == 1'b1) // If enabledc high then increment countervalue by 1
            CounterValue <= CounterValue + 4'b0001;
    end

endmodule