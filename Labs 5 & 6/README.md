# Lab 5 - The Write-Back (WB) Stage

## Overview
### Purpose
- Select between the memory read data and the ALU result using the MemtoReg MUX
- Write the selected value back into the register file at the destination register
- Complete the instruction’s execution and make the new register value available for following instructions
### Components
- [**Multiplexer (MUX)**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mux_2x1_32bit.v)**:**
### Connections
- 
### Expected Inputs & Outputs
- Inputs
- Outputs

## Code
### Block diagram for the WB stage
### ![Block diagram](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/wb%20stage%20block%20diagram.png)
### You can find the code for the WB stage [*here*](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/wb_stage.v)

# Lab 6 - Testing the MIPS Datapath (Final Project)

## Overview
### Purpose
- 
### Components
- [**IF Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/if_stage.v)**:**
- [**ID Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/id_stage.v)**:**
- [**EX Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/ex_stage.v)**:**
- [**MEM Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/mem_stage.v)**:**
- [**WB Stage**](https://github.com/fctanglao/ComputerArchitectureLabs/blob/main/Labs%205%20%26%206/wb_stage.v)**:**
### Connections
- 
### Expected Inputs & Outputs
- Inputs
- Outputs

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
