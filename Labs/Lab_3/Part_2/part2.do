# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using mux as the top level simulation module
vsim part2

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# Test case 1: Function 00 - Addition (A=0000 + B=0000) | Expected: ALUout = 0000 0000
force A 4'b0000
force B 4'b0000
force Function 2'b00
run 10ns

# Test case 2: Function 00 - Addition with carry (A=1111 + B=0001) | Expected: ALUout = 0001 0000
force A 4'b1111
force B 4'b0001
force Function 2'b00
run 10ns

# Test case 3: Function 01 - OR reduction (A=0000, B=0000) | Expected: ALUout = 00000000
force A 4'b0000
force B 4'b0000
force Function 2'b01
run 10ns

# Test case 4: Function 01 - OR reduction (A=1010, B=0101) | Expected: ALUout = 00000001
force A 4'b1010
force B 4'b0101
force Function 2'b01
run 10ns

# Test case 5: Function 10 - AND reduction (A=1111, B=1111) | Expected: ALUout = 00000001
force A 4'b1111
force B 4'b1111
force Function 2'b10
run 10ns

# Test case 6: Function 10 - AND reduction (A=1111, B=0111) | Expected: ALUout = 00000000
force A 4'b1111
force B 4'b0111
force Function 2'b10
run 10ns

# Test case 7: Function 11 - Concatenation (A=1010, B=1100) | Expected: ALUout = 1010 1100
force A 4'b1010
force B 4'b1100
force Function 2'b11
run 10ns

# Test case 8: Function 11 - Concatenation (A=1111, B=0000) | Expected: ALUout = 1111 0000
force A 4'b1111
force B 4'b0000
force Function 2'b11
run 10ns