`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:43:29
// Design Name: 
// Module Name: hex_test
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


module hex_test(
  input      [15:0] sw,
  output     [15:0] led,
  output reg [6:0]  hex,
  output     [7:0]  hex_on
    );

  assign hex_on = 8'b1111_0111; //Включение последнего семисегментника
  assign led    = sw; //Включение ламп
  reg [3:0] sem;
  wire [3:0] dc1, dc2, fun;
  
  assign dc1 = sw[0] + sw[1] + sw[2] + sw[3];
  assign dc2 = sw[7:4] | 4'b0111;
  assign fun = sw[0]^sw[1]|sw[2]&sw[3];
  
  always @(*) begin
    case (sw[9:8])
      2'd0 : sem = dc1;
      2'd1 : sem = dc2;
      2'd2 : sem = fun;
      2'd3 : sem = sw[3:0];
    endcase
  end
  
  always @(*) begin
    case (sem)
      4'd0 : hex = 7'b1000000;
      4'd1 : hex = 7'b1111001;
      4'd2 : hex = 7'b0100100;
      4'd3 : hex = 7'b0110000;
      4'd4 : hex = 7'b0011001;
      4'd5 : hex = 7'b0010010;
      4'd6 : hex = 7'b0000010;
      4'd7 : hex = 7'b1111000;
      4'd8 : hex = 7'b0000000;
      4'd9 : hex = 7'b0010000;
      4'd10 : hex = 7'b0001000;
      4'd11 : hex = 7'b0000011;
      4'd12 : hex = 7'b1001100;
      4'd13 : hex = 7'b0100001;
      4'd14 : hex = 7'b0000110;
      4'd15 : hex = 7'b0001110;
      
    endcase
  end
      
    
endmodule
