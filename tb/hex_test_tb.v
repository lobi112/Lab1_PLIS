`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:54:15
// Design Name: 
// Module Name: hex_test_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hex_test_tb(

    );

reg [9:0] sw;
wire [6:0] hex;
wire [7:0] AN;

hex_test UTD
(.sw(sw),
.hex(hex),
.AN(AN)
);

initial begin
sw[9:0]=2'd0;
#400;
sw[9:0]=2'd1;
#400;
sw[9:0]=2'd2;
#400;
sw[9:0]=2'd3;
#400;
$stop;
end

initial begin 
sw[3:0]=4'd0;
sw[7:4]=4'd0;
repeat(16) begin
#100;
sw[3:0]=$random();
sw[7:4]=$random();
end
end
    
endmodule
