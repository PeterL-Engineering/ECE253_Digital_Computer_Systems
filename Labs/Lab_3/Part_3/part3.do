# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part3.sv

#load simulation using mux as the top level simulation module
vsim part3

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# Initialize clock with proper timing (10ns period = 20ns for full cycle)
force Clock 0 0ns, 1 {10ns} -r 20ns
force Reset_b 0
force Data 4'b0000
force Function 2'b00
run 40ns

# Release reset and run initial setup
force Reset_b 1
run 20ns

# Test case 1: Function 11 - Load immediate value 5 
force Data 4'b0101
force Function 2'b11
run 20ns  # Wait for full clock cycle after input change
# Expected: ALU_reg_out = 00000101 on next clock edge

# Test case 2: Function 00 - Add 3 to stored value (5 + 3 = 8)
force Data 4'b0011
force Function 2'b00
run 20ns
# Expected: ALU_reg_out = 00001000

# Test case 3: Function 01 - Multiply by 2 (8 * 2 = 16)
force Data 4'b0010
force Function 2'b01
run 20ns
# Expected: ALU_reg_out = 00010000

# Test case 4: Function 10 - Left shift by 1 (16 << 1 = 32)
force Data 4'b0001
force Function 2'b10
run 20ns
# Expected: ALU_reg_out = 00100000

# Test case 5: Reset test - Apply reset during operation
force Data 4'b1111
force Function 2'b11
run 20ns
force Reset_b 0  
run 20ns
# Expected: ALU_reg_out = 00000000 (reset value)

# Test case 6: Continue from reset - Load new value
force Reset_b 1
force Data 4'b0001
force Function 2'b11
run 20ns
# Expected: ALU_reg_out = 00000001

# Test case 7: Sequential addition
force Function 2'b00  
run 20ns  
# 1+1=2
run 20ns  
# 2+1=3
run 20ns  
# 3+1=4

# Test case 8: Load and shift
force Data 4'b0100
force Function 2'b11  
# Load 4
run 20ns

force Data 4'b0001
force Function 2'b10  
# Shift left by 1 (4 << 1 = 8)
run 20ns

force Data 4'b0010
force Function 2'b10  
# Shift left by 2 (8 << 2 = 32)
run 20ns