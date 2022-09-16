module Data_path 
    (
        input wire CLK, Reset, regwrite, RegDST, ALUSrc, MemtoReg, PCSrc,  Jump,
        input wire [31:0] Instr, ReadData,
        input wire [2:0] ALUControl,
        output wire [31:0] PC, ALUOut, WriteData,
        output wire Zero
    );

wire [4:0] WriteReg;
wire [31:0] Result;
wire [31:0] SrcA;
wire [31:0] SrcB;
wire [31:0] Signlmm;
wire [31:0] PCBranch_inA;
wire [27:0] Shift_28out;
wire [31:0] PCPlus4;
wire [31:0] PCBranch;
wire [31:0] PC_in;
wire [31:0] Out_mux1to2;

register_file #(.Data_Width(32),.addres_width(5)) U_register_file
(
.clk(CLK),
.rst(Reset),
.WE3(regwrite),
.A1(Instr[25:21]),
.A2(Instr[20:16]),
.A3(WriteReg),
.WD3(Result),
.RD1(SrcA),
.RD2(WriteData)
);

Mux U_Mux_SrcB
(
.D0(WriteData), .D1(Signlmm), .S(ALUSrc), .Y(SrcB)
);

Mux # (.width(5)) U_Mux_WriteReg 
(
.D0(Instr[20:16]), .D1(Instr[15:11]), .S(RegDST), .Y(WriteReg)
);

ALUunit U_ALUunit
(
.SrcA(SrcA), 
.SrcB(SrcB),
.ALUControl(ALUControl),
.ALUResult(ALUOut),
.Zero(Zero)
);

Sign_Extend U_Sign_Extend 
(
.instr(Instr[15:0]), .SignImm(Signlmm)
);

shift_left U_shift_32
(
.in_shift(Signlmm), .out_shift(PCBranch_inA)
); 

shift_left #(.in_width(26),.out_width(28)) U_shift_26
(
.in_shift(Instr[25:0]), .out_shift(Shift_28out)
);

Adder U_PC_Branch
(
.A(PCBranch_inA),
.B(PCPlus4),
.C(PCBranch)
);

Adder U_PC_Pluse4 
(
.A(PC),
.B(32'd4),
.C(PCPlus4)
);

PCunit U_PCunit 
(
.PC_in(PC_in), .clk(CLK), .rst(Reset), .PC_out(PC)
);

Mux U_Mux_1to2
(
.D0(PCPlus4), .D1(PCBranch), .S(PCSrc), .Y(Out_mux1to2)
);

Mux U_Mux_2
(
.D0(Out_mux1to2), .D1({PCPlus4[31:28],Shift_28out}), .S(Jump), .Y(PC_in)
);

Mux U_Mux_Result
(
.D0(ALUOut), .D1(ReadData), .S(MemtoReg), .Y(Result)
);
endmodule