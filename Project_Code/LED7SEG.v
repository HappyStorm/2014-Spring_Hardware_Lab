`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:04 05/25/2014 
// Design Name: 
// Module Name:    LED7SEG 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LED7SEG(DIGIT, DISPLAY, score_tens, score_unit, clk);
	input clk;
	input [3:0] score_tens;
	input [3:0] score_unit;
	
	output reg [3:0] DIGIT;
	output reg [7:0] DISPLAY;

	reg [3:0] value;
	
	always @(posedge clk) begin	
		case(DIGIT) 			// from right to left
			4'b0111: begin		// 3rd light
				value = 0;
				DIGIT <= 4'b1011;
			end
			4'b1011: begin		// 2nd light
				value = score_tens;
				DIGIT <= 4'b1101;
			end
			4'b1101: begin		// 1st light
				value = score_unit; 
				DIGIT <= 4'b1110;
			end
			4'b1110: begin		// 4th light
				value = 0;
				DIGIT <= 4'b0111;
			end
			default begin
				DIGIT <= 4'b0111;
			end
		endcase
	end

	
	always @(*)begin 
		case(value) 
			4'h0: DISPLAY = 8'b11000000;
			4'h1: DISPLAY = 8'b11111001;
			4'h2: DISPLAY = 8'b00100100;
			4'h3: DISPLAY = 8'b00110000;
			4'h4: DISPLAY = 8'b00011001;
			4'h5: DISPLAY = 8'b00010010;
			4'h6: DISPLAY = 8'b00000010;
			4'h7: DISPLAY = 8'b11111000;
			4'h8: DISPLAY = 8'b00000000;
			4'h9: DISPLAY = 8'b00010000;
			default: begin
				DISPLAY = 8'b11111111;
			end
		endcase 
	end

endmodule
