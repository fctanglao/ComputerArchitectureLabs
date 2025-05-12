# Lab 2 - The ID Stage

## Overview
### Purpose
- Decode opcode and fields from the fetched instruction
- Read source operands from the register file
- Generate control signals based on the opcode via the control unit
- Sign-extend the 16-bit immediate field to 32 bits for ALU operations
- Latch decoded values, operands, immediates, and control bits into the ID/EX pipeline register
### Components
- [**Sign Extend**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/sign_extend.v)**:** Holds the 32-bit address of the program instruction
- [**Control**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/control.v)**:**
- [**Register File**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/reg_file.v)**:** Reads 
- [**ID/EX Pipeline Register (Latch)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id_ex_latch.v)**:** Captures the instruction bits (IR) and next‐PC (NPC) from the IF stage
### Connections
-
### Expected Inputs & Outputs
- 

## Code
### Block diagram for the ID stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id%20stage%20block%20diagram.png)
### You can find the code for the ID stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id_stage.v)

## Screenshot
### Testbench for the ID stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id%20stage%20testbench.png)
### You can find the code for the ID stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id_stage_tb.v)
