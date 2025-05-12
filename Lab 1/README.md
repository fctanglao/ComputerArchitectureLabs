# Lab 1 - The IF Stage

## Overview
### Purpose
- Retrieve the 32-bit instruction from instruction memory using the current PC
- Increment the PC by 4 to compute the next sequential address
- Select between the sequential PC+4 and a branch target (via the PCSrc mux) for the next PC
- Latch the fetched instruction and PC+4 into the IF/ID pipeline register for the next stage
### Components
- [**Program Counter**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/program_counter.v)**:** Holds the 32-bit address of the instruction to fetch
- **Instruction Memory [instruction_memory](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/instruction_memory.v):** A 128×32-bit read-only memory storing the program’s instructions
- **2x1 32-Bit Mux [mux_2x1_32bit](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/mux_2x1_32bit.v):** A 32-bit adder that adds the constant 4 to the current PC to compute the address of the next sequential instruction (PC+4)
- **Adder [adder](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/adder.v):** A 2-to-1 selector that chooses between the adder’s PC + 4 output and a branch-target address
- **IF/ID Latch [if_id_latch](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if_id_latch.v):** An edge-triggered latch capturing and holding two 32-bit values at the end of the IF stage (The fetched instruction and the PC + 4 value)
### Connections
- 
### Expected Inputs & Outputs
- 

## Code
### Block diagram for the IF stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if%20stage%20block%20diagram.png)
### You can find the code for the IF stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if_stage.v)

## Screenshot
### Testbench for the IF stage
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if%20stage%20testbench.png)
### You can find the code for the IF stage testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Lab%201/if_stage_tb.v)
