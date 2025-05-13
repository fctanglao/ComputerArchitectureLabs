# Lab 4 - The Memory Access (MEM) Stage 

## Overview
### Purpose
- Use the ALU result as the address to read from or write to data memory
- For loads, capture the data read from memory
- For stores, write the register data to memory
- Evaluate branch decisions by combining the zero flag with the branch control signal to drive PCSrc
- Pass along the memory data and control bits via the MEM/WB latch
### Components
- [**AND Gate**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/and_gate.v)**:** Combines the zero flag with the branch control signal; if both are true, asserts PCSrc to cause the next PC to be the branch target
- [**Data Memory Unit**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/data_memory.v)**:** If MemRead is asserted, reads a word from the address given by the ALU result; if MemWrite is asserted, writes the second register operand to that address
- [**MEM/WB Latch**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem_wb_latch.v)**:** Latches the data read from memory, the ALU result, and control signals to pass to the next stage
### Connections
- 
### Expected Inputs & Outputs
- Inputs
  - Control signals
  - Branch target address
  - ALU zero flag
  - ALU result
  - Register read data 2
- Outputs
  - Control signals
  - Data memory read data
  - ALU result
  - Write register address

## Code
### Block diagram for the MEM stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem%20stage%20block%20diagram.png)
### You can find the code for the MEM stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem_stage.v)

## Screenshot
### Testbench for the MEM stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem%20stage%20testbench.png)
### You can find the code for the MEM stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem_stage_tb.v)
