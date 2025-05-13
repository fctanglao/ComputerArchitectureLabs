# Lab 2 - The Instruction Decode (ID) Stage

## Overview
### Purpose
- Decode opcode and fields from the fetched instruction
- Read source operands from the register file
- Generate control signals based on the opcode via the control unit
- Sign-extend the 16-bit immediate field to 32 bits for ALU operations
- Latch decoded values, operands, immediates, and control bits into the ID/EX latch
### Components
- [**Sign-Extend Unit**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/sign_extend.v)**:** Extends 16-bit immediate to 32 bits
- [**Control Unit**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/control.v)**:** Generates WB, M. and EX control signals used in other stages
- [**Register File**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/reg_file.v)**:** Reads and outputs register values
- [**ID/EX Latch**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id_ex_latch.v)**:** Passes decoded information to the next stage
### Connections
- IF/ID instruction bits (IR) are decoded to provide the opcode, source registers, and immmediate field
- IF/ID next-PC value (NPC) is forwarded to the next stage
- Sign-extend unit latches the extended immediate to the ID/EX latch
- Control unit generates and pipelines control signals to other stages
- Register file latches the contents in the source registers to the ID/EX latch
### Expected Inputs & Outputs
- Inputs
  - Register write enable
  - IF/ID next-PC (NPC)
  - IF/ID instruction (IR)
  - Write register address
  - Write data
- Outputs
  - Control signals
  - ID/EX next-PC (NPC)
  - Read data 1 & 2
  - Sign-extended immediate
  - Function code

## Code
### Block diagram for the ID stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id%20stage%20block%20diagram.png)
### You can find the code for the ID stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id_stage.v)

## Screenshot
### Testbench for the ID stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id%20stage%20testbench.png)
### You can find the code for the ID stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%202/id_stage_tb.v)
