module PCunit
    (
        input wire [31:0] PC_in,
        input wire clk, rst,
        output reg [31:0] PC_out
    );
always @(posedge clk, negedge rst) 
begin
    if (!rst) 
    begin
        PC_out <= 32'b0;
    end
    else
    begin
        PC_out <= PC_in;
    end
end
endmodule