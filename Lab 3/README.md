# Lab 3 - The Execute (EX) Stage

## Overview
### Purpose
- Perform the specified ALU operation
- Compute the branch target address by adding the sign-extended immediate to the PC + 4
- Select between the second register operand and the immediate via the ALUSrc MUX
- Choose the write-back destination register vis the RegDst MUX
- Latch the ALU result, zero flag, branch target, and control signals into the EX/MEM latch
### Components
- [**5-Bit Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/mux_2x1_5bit.v)**:** Selects the destination register number for the WB stage
- [**32-Bit Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/mux_2x1_32bit.v)**:** Chooses between the second register operand or the sign-extended immediate as the ALU’s second input
- [**ALU Control Unit**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/alu_control.v)**:** Combines the high-level ALUOp bits with the instruction’s funct field to produce the specific ALU operation code
- [**ALU**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/alu.v)**:** Performs arithmetic/logical operations on its two inputs and outputs the result and a zero flag
- [**Adder**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/adder.v)**:** Adds the sign-extended immediate (shifted left two bits) to NPC to compute the branch target address
- [**EX/MEM Latch**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex_mem_latch.v)**:**  Latches the ALU result, zero flag, branch target, read data 2, and relevant control signals for the MEM stage
### Connections
- Multiplexers select appropriate data paths based on instruction type
- ALU control unit receives operation type from control signals and function code
- ALU receives operands from register file or sign-extended immediate value
- Adder combines PC + 4 and the sign-extended immediate value
- Results are stored in the EX/MEM latch
### Expected Inputs & Outputs
- Inputs
  - Control signals (WB, M, RegDst, ALUOp, ALUSrc)
  - ID/EX next-PC (NPC)
  - Register read data 1 & 2
  - Sign-extended immediate
  - Function code
- Outputs
  - Control signals (WB, MemRead, MemWrite, Branch)
  - Branch target address
  - ALU zero flag
  - ALU result
  - Register read data 2

## Code
### Block diagram for the EX stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex%20stage%20block%20diagram.png)
### You can find the code for the EX stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex_stage.v)

## Screenshot
### Testbench for the EX stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex%20stage%20testbench.png)
### You can find the code for the EX stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%203/ex_stage_tb.v)
