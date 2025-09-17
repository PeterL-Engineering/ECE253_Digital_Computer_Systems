# Set the working directory
vlib work

# Compile all modules
vlog v7432_Quad_2_Input_OR.sv

# Load simulation using v7432 as the top level module
vsim v7432

# Log all signals and add to waveform window
log {/*}
add wave {/*}

# Add all individual OR gate signals for detailed monitoring
add wave -position insertpoint  \
sim:/v7432/u0/* \
sim:/v7432/u1/* \
sim:/v7432/u2/* \
sim:/v7432/u3/*

# Test Case 1: All inputs LOW (0) - All outputs should be 0
force {pin1} 0
force {pin2} 0
force {pin4} 0
force {pin5} 0
force {pin9} 0
force {pin10} 0
force {pin12} 0
force {pin13} 0
run 10ns

# Test Case 2: All inputs HIGH (1) - All outputs should be 1
force {pin1} 1
force {pin2} 1
force {pin4} 1
force {pin5} 1
force {pin9} 1
force {pin10} 1
force {pin12} 1
force {pin13} 1
run 10ns

# Test Case 3: Test OR Gate 1 (pins 1,2 → pin3)
force {pin1} 0
force {pin2} 0
force {pin4} 0
force {pin5} 0
force {pin9} 0
force {pin10} 0
force {pin12} 0
force {pin13} 0
run 5ns
force {pin1} 1
run 5ns
force {pin2} 1
run 5ns
force {pin1} 0
run 5ns

# Test Case 4: Test OR Gate 2 (pins 4,5 → pin6)
force {pin1} 0
force {pin2} 0
force {pin4} 0
force {pin5} 0
force {pin9} 0
force {pin10} 0
force {pin12} 0
force {pin13} 0
run 5ns
force {pin4} 1
run 5ns
force {pin5} 1
run 5ns
force {pin4} 0
run 5ns

# Test Case 5: Test OR Gate 3 (pins 9,10 → pin8)
force {pin1} 0
force {pin2} 0
force {pin4} 0
force {pin5} 0
force {pin9} 0
force {pin10} 0
force {pin12} 0
force {pin13} 0
run 5ns
force {pin9} 1
run 5ns
force {pin10} 1
run 5ns
force {pin9} 0
run 5ns

# Test Case 6: Test OR Gate 4 (pins 12,13 → pin11)
force {pin1} 0
force {pin2} 0
force {pin4} 0
force {pin5} 0
force {pin9} 0
force {pin10} 0
force {pin12} 0
force {pin13} 0
run 5ns
force {pin12} 1
run 5ns
force {pin13} 1
run 5ns
force {pin12} 0
run 5ns