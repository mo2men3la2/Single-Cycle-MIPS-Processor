module Control_Unit #(parameter width =6)
(
input  [width-1:0] Funct,
input  [width-1:0] OPcode,
input wire         Zero,
output             Jump,
output             MemtoReg,
output             MemWrite,
output             Branch,
output             ALUSrc,
output             RegDst,
output             RegWrite,
output [2:0]       ALUControl,
output wire        PCSrc
);

wire   [1:0]       ALUOp;

assign PCSrc = Zero & Branch;

 Main_Decoder main_decoder (
 .opcode(OPcode),
 .jump(Jump) , 
 .memtoreg(MemtoReg),  
 .memwrite(MemWrite), 
 .branch(Branch) ,
 .alusrc(ALUSrc) ,
 .regdst(RegDst) ,
 .regwrite(RegWrite), 
 .aluop(ALUOp)      
 );

ALU_Decoder alu_decoder (
.funct(Funct),    
.Aluop(ALUOp), 
.alucontrol(ALUControl)
);

endmodule