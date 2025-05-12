# Lab 4 - The MEM Stage (Memory Access)

## Overview
- ### Purpose
  - Use the ALU result as the address to read from or write to data memory
  - For loads, capture the data read from memory
  - For stores, write the register data to memory
  - Evaluate branch decisions by combining the zero flag with the branch control signal to drive PCSrc
  - Pass along the memory data and control bits via the MEM/WB latch
- ### Components
  - [**AND Gate**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/and_gate.v)**:**
  - [**Data Memory**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/data_memory.v)**:**
  - [**MEM/WB Latch**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem_wb_latch.v)**:**
- ### Connections
  - 
- ### Expected Inputs & Outputs
  - 

## Code
### Block diagram for the MEM stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem%20stage%20block%20diagram.png)
### You can find the code for the MEM stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem_stage.v)

## Screenshot
### Testbench for the MEM stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem%20stage%20testbench.png)
### You can find the code for the MEM stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%204/mem_stage_tb.v)
