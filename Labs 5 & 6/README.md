# Lab 5 - The Write-Back (WB) Stage

## Overview
### Purpose
- Select between the memory read data and the ALU result using the MemtoReg MUX
- Write the selected value back into the register file at the destination register
- Complete the instruction’s execution and make the new register value available for following instructions
### Components
- [**Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mux_2x1_32bit.v)**:** Selects whether the value to write back to the register file comes from data memory or directly from the ALU
### Connections
- 
### Expected Inputs & Outputs
- Inputs
  - Control signal (MemtoReg)
  - Data memory read data
  - ALU result
  - Write register address
- Outputs
  - Write data

## Code
### Block diagram for the WB stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/wb%20stage%20block%20diagram.png)
### You can find the code for the WB stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/wb_stage.v)

### Note: We test the WB stage in [Lab 6](#lab-6---testing-the-mips-datapath-final-project) below
# Lab 6 - Testing the MIPS Datapath (Final Project)

## Overview
### Purpose
- Connects the PC, instruction memory, register file, ALU, data memory, and write-back MUX into a single structural framework that implements the MIPS ISA in hardware
- Splits instruction processing into five overlappable stages (IF, ID, EX, MEM, WB) so multiple instructions can be in flight simultaneously
- Uses IF/ID, ID/EX, EX/MEM, and MEM/WB latches to decouple each stage’s logic, allowing the clock to run at a higher frequency
- Leaves all data routing and operations in the datapath, while a dedicated control unit generates signals to steer multiplexers and functional units
- Provides a clear, repeatable template for implementing, testing, and extending the processor’s hardware datapath in Verilog
### Components
- [**IF Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/if_stage.v)**:** Fetches the instruction at the address held in the PC, computes PC + 4 to point to the next sequential instruction, selects between PC + 4 and any branch target via the PCSrc MUX, and latches the fetched instruction and PC + 4 into the IF/ID latch
- [**ID Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/id_stage.v)**:** Reads the instruction and PC + 4 from the IF/ID latch, decodes the opcode to generate control signals, reads the two source registers from the register file, sign-extends the 16-bit immediate, and latches all data and controls into the ID/EX latch
- [**EX Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/ex_stage.v)**:** Takes operands and control signals from the ID/EX latch, uses the ALU to perform arithmetic/logical operations or compute branch targets, selects between register or immediate inputs via ALUSrc, and forwards the ALU result, zero flag, target address, and control bits into the EX/MEM latch
- [**MEM Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mem_stage.v)**:** Uses ALU result as the data memory address to perform loads or stores under MemRead/MemWrite, evaluates branch decisions by ANDing zero and branch to drive PCSrc next cycle, and latches read data or the ALU result plus control signals into the MEM/WB latch
- [**WB Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/wb_stage.v)**:** Selects between read data and ALU result via the MemtoReg MUX, and writes the chosen value back into the destination register of the register file

## Code
### Block diagram for the MIPS datapath
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mips%20datapath%20block%20diagram.png)
### You can find the code for the MIPS datapath [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mips_datapath.v)

## Screenshot
### Testbench for the MIPS datapath
### ![Testbench](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mips%20datapath%20testbench.png)
### Tcl console output for the MIPS datapath
### ![Tcl console](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mips%20datapath%20tcl%20console%20output.png)
### You can find the code for the MIPS datapath testbench [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mips_datapath_tb.v)

## Conclusion
### Protection Against Hazards
-   
### Instruction Reordering
- 
### WT and/or WB Improvements
- 
