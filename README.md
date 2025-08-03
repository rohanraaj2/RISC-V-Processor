# RISC-V Processor Project

This repository contains multiple implementations of a RISC-V processor in Verilog/SystemVerilog, including single-cycle, pipelined, and pipelined with hazard detection architectures. It also includes a RISC-V assembly sorting algorithm and corresponding machine code.

## Project Overview

### 1. Single Cycle Processor
- **Description:** Implements a basic RISC-V processor where each instruction executes in a single clock cycle. Includes all core modules such as ALU, Control Unit, Register File, Data/Instruction Memory, and more.

### 2. Pipelined Processor
- **Description:** Implements a 5-stage pipelined RISC-V processor (IF, ID, EX, MEM, WB) for improved throughput. Includes pipeline registers and all necessary modules for pipelined execution.

### 3. Pipelined Processor with Hazard Detection
- **Description:** Extends the pipelined processor with hazard detection and forwarding logic to handle data and control hazards. Includes additional modules for stalling and forwarding.

### 4. Sorting Algorithm
- **Description:** Contains a RISC-V assembly program implementing insertion sort (`Sorting Algorithm.asm`) and its corresponding machine code (`Machine Code.asm`).

## How to Use

1. **Simulation:**
   - Use a Verilog/SystemVerilog simulator (e.g., Xilinx Vivado, ModelSim, Icarus Verilog) to run the testbenches provided in each processor's `Test Bench` folder.

2. **Assembly Programs:**
   - The `Sorting Algorithm` folder contains example RISC-V assembly and its machine code, which can be loaded into the instruction memory for simulation.

3. **Customization:**
   - You can modify or extend the processor modules or assembly programs as needed for your experiments or coursework.

## File Naming Conventions

- `.v` files: Verilog modules
- `.sv` files: SystemVerilog modules and testbenches
- `.asm`: RISC-V assembly code
- `*_tb.sv`: Testbenches
