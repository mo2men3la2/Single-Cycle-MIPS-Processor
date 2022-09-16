# Single-Cycle-MIPS-Processor
## Introduction:
In this project, I have implemented a 32-bit single-cycle microarchitecture  MIPS processor based on Harvard Architecture. The single-cycle microarchitecture executes an entire instruction in one cycle. In other words instruction fetch, instruction decode, execute,  write back, and program counter update occurs within a single clock cycle.
## Objective:
Referring to the figure below. I have written the RTL Verilog files for all submodules of the MIPS processor (e.g. Register File, Instruction Memory, etc.). Then, implemented the top module of the MIPS processor.
![Figure: 1](https://user-images.githubusercontent.com/54054905/190649713-78ed83d0-523c-4eab-96d0-42b4fae0a750.PNG)
## Top Module View:
The processor is composed of a datapath and a controller. The controller is internally composed of the main decoder and the ALU decoder. The two figures below show a block diagram of the single-cycle MIPS processor interfaced to external memories and a result from RTL viewer desgined by Quartus Software.
![Figure: 2](https://user-images.githubusercontent.com/54054905/190653604-9b033050-60ba-42e9-999f-9c299dbbc27f.png) ![image](https://user-images.githubusercontent.com/54054905/190665039-f42a1e2a-3177-4a65-92bc-f838993ca942.png)
## Data Path Unit:
![image](https://user-images.githubusercontent.com/54054905/190666051-1d27ac1d-8c4a-4d0c-9e47-25317e2d52f9.png)
## Control Unit:
![image](https://user-images.githubusercontent.com/54054905/190666409-2682e300-6077-4ca9-a8aa-4a02f9434a33.png)
## Instruction Memory:
![image](https://user-images.githubusercontent.com/54054905/190666820-3df31ec4-25a5-4deb-b2cf-567f17abb5b2.png)
## Data Memory:

