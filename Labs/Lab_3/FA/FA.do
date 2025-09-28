# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog FA.sv

#load simulation using mux as the top level simulation module
vsim FA

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# Test case 1: a=0, b=0, c_in=0 | Expected: s=0, c_out=0
force a 0
force b 0
force c_in 0
#run simulation for a few ns
run 10ns

# Test case 2: a=0, b=0, c_in=1 | Expected: s=1, c_out=0
force a 0
force b 0
force c_in 1
#run simulation for a few ns
run 10ns

# Test case 3: a=1, b=1, c_in=0 | Expected: s=0, c_out=1
force a 1
force b 1
force c_in 0
#run simulation for a few ns
run 10ns

# Test case 4: a=1, b=1, c_in=1 | Expected: s=1, c_out=1
force a 1
force b 1
force c_in 1
#run simulation for a few ns
run 10ns

# Test case 5: a=1, b=0, c_in=1 | Expected: s=0, c_out=1
force a 1
force b 0
force c_in 1
#run simulation for a few ns
run 10ns

# Test case 6: a=0, b=1, c_in=1 | Expected: s=0, c_out=1
force a 0
force b 1
force c_in 1
#run simulation for a few ns
run 10ns