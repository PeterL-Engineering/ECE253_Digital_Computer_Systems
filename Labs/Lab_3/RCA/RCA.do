# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog RCA.sv

#load simulation using mux as the top level simulation module
vsim RCA

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# Test case 1: Zero addition - a=0000, b=0000, c_in=0 | Expected: s=0000, c_out=0
force a 4'b0000
force b 4'b0000
force c_in 0
run 10ns

# Test case 2: Maximum value addition - a=1111, b=1111, c_in=1 | Expected: s=1111, c_out=1 (15+15+1=31, but 4-bit result)
force a 4'b1111
force b 4'b1111
force c_in 1
run 10ns

# Test case 3: Carry propagation test - a=0001, b=0001, c_in=1 | Expected: s=0011, c_out=0 (1+1+1=3)
force a 4'b0001
force b 4'b0001
force c_in 1
run 10ns

# Test case 4: Boundary case - a=1111, b=0000, c_in=1 | Expected: s=0000, c_out=1 (15+0+1=16, overflow)
force a 4'b1111
force b 4'b0000
force c_in 1
run 10ns

# Test case 5: Power-of-two boundary - a=1000, b=1000, c_in=0 | Expected: s=0000, c_out=1 (8+8=16, overflow)
force a 4'b1000
force b 4'b1000
force c_in 0
run 10ns

# Test case 6: Sequential carry test - a=0111, b=0001, c_in=0 | Expected: s=1000, c_out=0 (7+1=8)
force a 4'b0111
force b 4'b0001
force c_in 0
run 10ns

# Test case 7: All bits different - a=1010, b=0101, c_in=0 | Expected: s=1111, c_out=0 (10+5=15)
force a 4'b1010
force b 4'b0101
force c_in 0
run 10ns

# Test case 8: Mid-range with carry - a=0110, b=0011, c_in=1 | Expected: s=1010, c_out=0 (6+3+1=10)
force a 4'b0110
force b 4'b0011
force c_in 1
run 10ns