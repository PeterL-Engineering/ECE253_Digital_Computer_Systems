# Set the working directory
vlib work

# Compile all modules
vlog v7404_Hex_INVERTER.sv

# Load simulation using v7404 as the top level module
vsim v7404

# Log all signals and add to waveform window
log {/*}
add wave {/*}

# Add all individual inverter signals for detailed monitoring
add wave -position insertpoint  \
sim:/v7404/u0/* \
sim:/v7404/u1/* \
sim:/v7404/u2/* \
sim:/v7404/u3/* \
sim:/v7404/u4/* \
sim:/v7404/u5/*

# Test Case 1: All inputs LOW (0)
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 10ns

# Test Case 2: All inputs HIGH (1)
force {pin1} 1
force {pin3} 1
force {pin5} 1
force {pin9} 1
force {pin11} 1
force {pin13} 1
run 10ns

# Test Case 3: Alternating pattern 1
force {pin1} 0
force {pin3} 1
force {pin5} 0
force {pin9} 1
force {pin11} 0
force {pin13} 1
run 10ns

# Test Case 4: Alternating pattern 2
force {pin1} 1
force {pin3} 0
force {pin5} 1
force {pin9} 0
force {pin11} 1
force {pin13} 0
run 10ns

# Test Case 5: Individual inverter testing - Inverter 1
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin1} 1
run 5ns

# Test Case 6: Individual inverter testing - Inverter 2
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin3} 1
run 5ns

# Test Case 7: Individual inverter testing - Inverter 3
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin5} 1
run 5ns

# Test Case 8: Individual inverter testing - Inverter 4
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin9} 1
run 5ns

# Test Case 9: Individual inverter testing - Inverter 5
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin11} 1
run 5ns

# Test Case 10: Individual inverter testing - Inverter 6
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin13} 1
run 5ns

# Test Case 11: Random pattern
force {pin1} 1
force {pin3} 0
force {pin5} 1
force {pin9} 0
force {pin11} 1
force {pin13} 0
run 5ns
force {pin1} 0
force {pin3} 1
force {pin5} 0
force {pin9} 1
force {pin11} 0
force {pin13} 1
run 5ns

# Test Case 12: All inputs toggle simultaneously
force {pin1} 0
force {pin3} 0
force {pin5} 0
force {pin9} 0
force {pin11} 0
force {pin13} 0
run 5ns
force {pin1} 1
force {pin3} 1
force {pin5} 1
force {pin9} 1
force {pin11} 1
force {pin13} 1
run 5ns