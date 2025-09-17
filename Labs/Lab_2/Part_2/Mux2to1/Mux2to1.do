# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog Mux2to1.sv

#load simulation using mux as the top level simulation module
vsim mux2to1

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# Test Case 1: s=0, x=0, y=0 → m=0
force {x} 0
force {y} 0
force {s} 0
run 10ns

# Test Case 2: s=0, x=0, y=1 → m=0
force {x} 0
force {y} 1
force {s} 0
run 10ns

# Test Case 3: s=0, x=1, y=0 → m=1
force {x} 1
force {y} 0
force {s} 0
run 10ns

# Test Case 4: s=0, x=1, y=1 → m=1
force {x} 1
force {y} 1
force {s} 0
run 10ns

# Test Case 5: s=1, x=0, y=0 → m=0
force {x} 0
force {y} 0
force {s} 1
run 10ns

# Test Case 6: s=1, x=0, y=1 → m=1
force {x} 0
force {y} 1
force {s} 1
run 10ns

# Test Case 7: s=1, x=1, y=0 → m=0
force {x} 1
force {y} 0
force {s} 1
run 10ns

# Test Case 8: s=1, x=1, y=1 → m=1
force {x} 1
force {y} 1
force {s} 1
run 10ns

# Test Case 9: Edge case - s changes while inputs stable
force {x} 1
force {y} 0
force {s} 0
run 5ns
force {s} 1
run 5ns

# Test Case 10: Edge case - inputs change while s stable
force {x} 0
force {y} 1
force {s} 1
run 5ns
force {x} 1
force {y} 0
run 5ns