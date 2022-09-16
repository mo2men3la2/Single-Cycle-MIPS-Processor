module ALUunit
    (
        input wire [31:0] SrcA, SrcB,
        input wire [2:0] ALUControl,
        output reg [31:0] ALUResult,
        output reg Zero
    );
always @(*) 
begin
    case (ALUControl)
        3'b000: ALUResult = SrcA & SrcB;
        3'b001: ALUResult = SrcA | SrcB;
        3'b010: ALUResult = SrcA + SrcB;
        3'b100: ALUResult = SrcA - SrcB;
        3'b101: ALUResult = SrcA * SrcB;
        3'b110: ALUResult = SrcA < SrcB;
        default: ALUResult = 0;
    endcase    
    Zero = ~|(ALUResult);
end
endmodule