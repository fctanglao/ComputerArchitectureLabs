# Lab 1 - The IF Stage (Instruction Fetch)

## Overview
### Purpose
- Retrieve the 32-bit instruction from instruction memory using the current PC
- Increment the PC by 4 (PC + 4) to compute the next sequential address
- Select between the sequential PC + 4 and a branch target for the next PC
- Latch the fetched instruction (IR) and PC + 4 (NPC) into the IF/ID pipeline register for the next stage
### Components
- [**Program Counter (PC)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/program_counter.v)**:** Holds the address of the program instruction
- [**Instruction Memory**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/instruction_memory.v)**:** Stores the program instruction
- [**Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/mux_2x1_32bit.v)**:** Chooses between PC + 4 and the branch target address
- [**Adder**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/adder.v)**:** Adds 4 to the current PC to compute the address of the next sequential instruction
- [**IF/ID Pipeline Register (Latch)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if_id_latch.v)**:** Stores the NPC and IR for the next stage
### Connections
- PC feeds the address input of the instruction memory
- PC feeds the adder to compute PC + 4
- Instruction Memory latches fetched instruction into the IF/ID pipeline register
- MUX writes selected NPC back into the PC
- Adder feeds PC + 4 into the MUX
- Adder latches PC + 4 into the IF/ID pipeline register
### Expected Inputs & Outputs
- Inputs
  - PCSrc select signal from the EX/MEM latch
  - Branch target address from the EX/MEM latch
- Outputs
  - PC + 4 (NPC)
  - Fetched instructions (IR)

## Code
### Block diagram for the IF stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if%20stage%20block%20diagram.png)
### You can find the code for the IF stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if_stage.v)

## Screenshot
### Testbench for the IF stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if%20stage%20testbench.png)
### You can find the code for the IF stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if_stage_tb.v)
