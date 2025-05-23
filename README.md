# 3-Bit Calculator

A Verilog implementation of a 3-bit calculator that supports various arithmetic operations including addition, subtraction, multiplication, and remainder calculation.

## Features

- 3-bit arithmetic operations
- Addition and Subtraction
- Multiplication
- Remainder calculation
- Comprehensive test benches for verification

## Components

The project consists of several Verilog modules:

### Core Components
- `alu.v` - Main Arithmetic Logic Unit
- `add_sub.v` - Addition and Subtraction module
- `multiplication.v` - Multiplication module
- `Remainder.v` - Remainder calculation module

### Supporting Components
- `halfadder.v` - Half adder implementation
- `fulladder.v` - Full adder implementation
- `c2s.v` - Carry to Sum converter
- `cs2.v` - Carry-Save to Sum converter

### Test Benches
- `alu_tb.v` - ALU test bench
- `add_sub_tb.v` - Addition/Subtraction test bench
- `tb_multiplication.v` - Multiplication test bench
- `remaindertb.v` - Remainder calculation test bench

## Usage

### Simulation
To simulate the design, you can use any Verilog simulator (e.g., Icarus Verilog, ModelSim). Here's an example using Icarus Verilog:

```bash
# Compile the ALU test bench
iverilog -o alu_sim alu.v alu_tb.v

# Run the simulation
vvp alu_sim
```

### Testing Different Operations
Each module has its own test bench that can be used to verify the functionality:

1. ALU Operations:
   - Addition
   - Subtraction
   - Multiplication
   - Remainder calculation

2. Individual Module Testing:
   - Test addition/subtraction using `add_sub_tb.v`
   - Test multiplication using `tb_multiplication.v`
   - Test remainder calculation using `remaindertb.v`

## Project Structure

```
3-Bit-Calculator/
├── alu.v                 # Main ALU implementation
├── alu_tb.v             # ALU test bench
├── add_sub.v            # Addition/Subtraction module
├── add_sub_tb.v         # Addition/Subtraction test bench
├── multiplication.v     # Multiplication module
├── tb_multiplication.v  # Multiplication test bench
├── Remainder.v          # Remainder calculation module
├── remaindertb.v        # Remainder test bench
├── halfadder.v          # Half adder implementation
├── fulladder.v          # Full adder implementation
├── c2s.v                # Carry to Sum converter
└── cs2.v                # Carry-Save to Sum converter
```

## Implementation Details

The calculator operates on 3-bit inputs and provides the following operations:
- Addition: A + B
- Subtraction: A - B
- Multiplication: A × B
- Remainder: A % B

Each operation is implemented using basic digital logic components and can be tested independently using the provided test benches.

## License

This project is open source and available for educational and research purposes. 