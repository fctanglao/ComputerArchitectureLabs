# Lab 3 - The Execute (EX) Stage

## Overview
### Purpose
- Perform the specified ALU operation
- Compute the branch target address by adding the sign-extended immediate to the PC + 4
- Select between the second register operand and the immediate via the ALUSrc MUX
- Choose the write-back destination register vis the RegDst MUX
- Latch the ALU result, zero flag, branch target, and control signals into the EX/MEM latch
### Components
- [**5-Bit Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/mux_2x1_5bit.v)**:**
- [**32-Bit Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/mux_2x1_32bit.v)**:**
- [**ALU Control Unit**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/alu_control.v)**:**
- [**ALU**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/alu.v)**:**
- [**Adder**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/adder.v)**:**
- [**EX/MEM Latch**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex_mem_latch.v)**:**
### Connections
- 
### Expected Inputs & Outputs
- 

## Code
### Block diagram for the EX stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex%20stage%20block%20diagram.png)
### You can find the code for the EX stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex_stage.v)

## Screenshot
### Testbench for the EX stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex%20stage%20testbench.png)
### You can find the code for the EX stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex_stage_tb.v)
