module TOP_Module
(
    input wire CLK, Reset,
    output wire [15:0] test_value
);

wire [31:0] Instr;
wire [31:0] ReadData;
wire [31:0] ALUOut;
wire [31:0] WriteData;
wire [31:0] PC;
wire MemWrite;
wire RegWrite;
wire ALUSrc;
wire memtoreg;
wire Branch;
wire Jump;
wire RegDST;
wire Zero;
wire [2:0]ALUControl;

Control_Unit U_Control_Unit
(
.Funct(Instr[5:0]),
.OPcode(Instr[31:26]),
.Zero(Zero),
.Jump(Jump),
.MemtoReg(memtoreg),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDST),
.RegWrite(RegWrite),
.ALUControl(ALUControl),
.PCSrc(PCSrc)
);

Data_path U_Data_path
(
.CLK(CLK), 
.Reset(Reset), 
.regwrite(RegWrite), 
.RegDST(RegDST), 
.ALUSrc(ALUSrc), 
.MemtoReg(memtoreg), 
.PCSrc(PCSrc),  
.Jump(Jump),
.Instr(Instr),
.ReadData(ReadData),
.ALUControl(ALUControl),
.PC(PC), 
.ALUOut(ALUOut), 
.WriteData(WriteData),
.Zero(Zero)
);

Instruction_Memory U_Instruction_Memory
(
.A(PC),
.RD(Instr)
);

DataMem U_DataMem
(
.A(ALUOut),
.WD(WriteData),
.we(MemWrite),
.clk(CLK),
.rst(Reset),
.RD(ReadData),
.test_value(test_value)
);
endmodule