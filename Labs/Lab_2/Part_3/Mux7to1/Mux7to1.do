# Set the working directory
vlib work

# Compile the module
vlog Mux7to1.sv

# Load simulation using mux7to1 as the top level module
vsim mux7to1

# Log all signals and add to waveform window
log {/*}
add wave {/*}

# Add the MuxIn bus as a grouped wave for easier viewing
add wave -noupdate -divider "Inputs"
add wave -color yellow -label MuxSelect sim:/mux7to1/MuxSelect
add wave -color cyan -label MuxIn sim:/mux7to1/MuxIn
add wave -divider "Output"
add wave -color red -label Out sim:/mux7to1/Out

# Test Case 1: Select each input sequentially with all inputs HIGH
force {MuxIn} 7'b1111111
force {MuxSelect} 3'b000
run 10ns
force {MuxSelect} 3'b001
run 10ns
force {MuxSelect} 3'b010
run 10ns
force {MuxSelect} 3'b011
run 10ns
force {MuxSelect} 3'b100
run 10ns
force {MuxSelect} 3'b101
run 10ns
force {MuxSelect} 3'b110
run 10ns

# Test Case 2: Select each input sequentially with all inputs LOW
force {MuxIn} 7'b0000000
force {MuxSelect} 3'b000
run 10ns
force {MuxSelect} 3'b001
run 10ns
force {MuxSelect} 3'b010
run 10ns
force {MuxSelect} 3'b011
run 10ns
force {MuxSelect} 3'b100
run 10ns
force {MuxSelect} 3'b101
run 10ns
force {MuxSelect} 3'b110
run 10ns

# Test Case 3: Test with alternating pattern 1010101
force {MuxIn} 7'b1010101
force {MuxSelect} 3'b000  # Should output MuxIn[0] = 1
run 10ns
force {MuxSelect} 3'b001  # Should output MuxIn[1] = 0
run 10ns
force {MuxSelect} 3'b010  # Should output MuxIn[2] = 1
run 10ns
force {MuxSelect} 3'b011  # Should output MuxIn[3] = 0
run 10ns
force {MuxSelect} 3'b100  # Should output MuxIn[4] = 1
run 10ns
force {MuxSelect} 3'b101  # Should output MuxIn[5] = 0
run 10ns
force {MuxSelect} 3'b110  # Should output MuxIn[6] = 1
run 10ns

# Test Case 4: Test with pattern 1100110
force {MuxIn} 7'b1100110
force {MuxSelect} 3'b000  # Should output MuxIn[0] = 0
run 10ns
force {MuxSelect} 3'b001  # Should output MuxIn[1] = 1
run 10ns
force {MuxSelect} 3'b010  # Should output MuxIn[2] = 1
run 10ns
force {MuxSelect} 3'b011  # Should output MuxIn[3] = 0
run 10ns
force {MuxSelect} 3'b100  # Should output MuxIn[4] = 0
run 10ns
force {MuxSelect} 3'b101  # Should output MuxIn[5] = 1
run 10ns
force {MuxSelect} 3'b110  # Should output MuxIn[6] = 1
run 10ns

# Test Case 5: Test default case (MuxSelect = 3'b111)
force {MuxIn} 7'b1111111
force {MuxSelect} 3'b111  # Should output 0 (default case)
run 10ns

# Test Case 6: Test with undefined select values
force {MuxIn} 7'b1010101
force {MuxSelect} 3'bxxx  # Should output 0 (default case)
run 10ns
force {MuxSelect} 3'bzzz  # Should output 0 (default case)
run 10ns

# Test Case 7: Rapid selection changes with fixed input pattern
force {MuxIn} 7'b1001001
force {MuxSelect} 3'b000  # Output = 1
run 5ns
force {MuxSelect} 3'b110  # Output = 1
run 5ns
force {MuxSelect} 3'b011  # Output = 0
run 5ns
force {MuxSelect} 3'b101  # Output = 0
run 5ns
force {MuxSelect} 3'b010  # Output = 0
run 5ns
force {MuxSelect} 3'b100  # Output = 1
run 5ns

# Test Case 8: Input changes while selection is fixed
force {MuxSelect} 3'b011  # Select MuxIn[3]
force {MuxIn} 7'b0000000
run 5ns
force {MuxIn} 7'b0001000  # Only MuxIn[3] changes to 1
run 5ns
force {MuxIn} 7'b0000000  # MuxIn[3] changes back to 0
run 5ns
force {MuxIn} 7'b1111111  # All inputs change to 1
run 5ns

# Test Case 9: Verify all select values work correctly
force {MuxIn} 7'b0000001  # Only MuxIn[0] = 1
force {MuxSelect} 3'b000  # Should output 1
run 5ns
force {MuxIn} 7'b0000010  # Only MuxIn[1] = 1
force {MuxSelect} 3'b001  # Should output 1
run 5ns
force {MuxIn} 7'b0000100  # Only MuxIn[2] = 1
force {MuxSelect} 3'b010  # Should output 1
run 5ns
force {MuxIn} 7'b0001000  # Only MuxIn[3] = 1
force {MuxSelect} 3'b011  # Should output 1
run 5ns
force {MuxIn} 7'b0010000  # Only MuxIn[4] = 1
force {MuxSelect} 3'b100  # Should output 1
run 5ns
force {MuxIn} 7'b0100000  # Only MuxIn[5] = 1
force {MuxSelect} 3'b101  # Should output 1
run 5ns
force {MuxIn} 7'b1000000  # Only MuxIn[6] = 1
force {MuxSelect} 3'b110  # Should output 1
run 5ns