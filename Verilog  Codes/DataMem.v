module DataMem(
   input      [31:0] A,
   input     [31:0] WD,
   input            we, clk,rst,
   output     [31:0] RD ,
   output [15:0] test_value
   );
   reg        [31:0] ram[0:99];
   integer i;
   
   always @ (posedge clk or negedge rst)
     begin
       if(!rst)
         begin
         for (i=0;i<100;i=i+1)
         ram[i] <= 0;
       end
        else if (we)
           ram[A] <= WD;
     end
   assign RD = ram[A]; 
   assign test_value = ram[0][15:0];

endmodule