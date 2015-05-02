`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:27 06/23/2014 
// Design Name: 
// Module Name:    note_generator 
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
// To generate audio left and audio right at desired note frequency (volume is set to the loudest by default)
module note_generator(
  note_div, // divisor for note generation
  audio_left, // left sound audio
  audio_right, // right sound audio
  clk, // clock from crystal
  rst_n // active low reset
);

// I/O declaration
	//input [1:0]volume;
	input clk; 		// clock from crystal
	input rst_n; 	// active low reset
	input [19:0] note_div; 			// divisor for note generation---> top module will supply
	output  [15:0] audio_left; 	// left sound audio
	output  [15:0] audio_right;	// right sound audio
	reg 	[3:0]volumeflag = 3;
	
// Declare internal signals
	reg [19:0] clk_cnt_next, clk_cnt;
	reg note_clk, note_clk_next;//control whether the note will work,work like debounce

// Note frequency generation
	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin//rst_n is pressed
			clk_cnt <= 20'd0;
			note_clk <= 1'b0;
		end
		else begin
			clk_cnt <= clk_cnt_next;
			note_clk <= note_clk_next;
		end
	end 
/*
	always@(posedge clk) begin		
		if(volume[1]==1) begin
			if(volumeflag<7) volumeflag = volumeflag+1;
			else volumeflag = 7;
		end
		else if(volume[0]==1) begin
			if(volumeflag>0) volumeflag = volumeflag-1;
			else volumeflag=0;
		end
	end
*/
	always @(*) begin
		if (clk_cnt == note_div) begin
			clk_cnt_next = 20'd0;
			note_clk_next = ~note_clk;
		end
		else begin
			clk_cnt_next = clk_cnt + 1'b1;
			note_clk_next = note_clk;
		end
	end

// Assign the amplitude of the note
	assign audio_left  = (note_clk == 1'b0) ? 16'h8000 : 16'h2FFF;	// loudest possible
	assign audio_right = (note_clk == 1'b0) ? 16'h8000 : 16'h2FFF;	// loudest possible
//	assign audio_left  = (note_clk == 1'b0) ? 16'h8000 : 16'h20;	// loudest possible
//	assign audio_right = (note_clk == 1'b0) ? 16'h8000 : 16'h20;	// loudest possible
	
/*	always @(*) begin
		if(note_clk == 1'b0) begin
			audio_left <=16'h8000;
			audio_right <=16'h8000;
		end
		else begin
			case(volumeflag)
				0: begin
					audio_left<=16'h8000;
					audio_right<=16'h8000;
				end
				1: begin
					audio_left<=16'h1000;
					audio_right<=16'h1000;
				end
				2: begin
					audio_left<=16'h2000;
					audio_right<=16'h2000;
				end
				3: begin
					audio_left<=16'h3000;
					audio_right<=16'h3000;
				end 
				4: begin
					audio_left<=16'h4000;
					audio_right<=16'h4000;
				end
				5:begin
					audio_left<=16'h5000;
					audio_right<=16'h5000;
				end
				6:begin
					audio_left<=16'h6000;
					audio_right<=16'h6000;
				end
				7:begin
					audio_left<=16'h7000;
					audio_right<=16'h7000;
				end
				default:begin
					audio_left<=16'h2000;
					audio_right<=16'h2000;
				end
			endcase
			if(audio_decrease==1'b0)begin
				audio_left=audio_left-16'h2000;
				audio_right=audio_right-16'h2000;
			end
			elseif(audio_increase==1'b0)begin
				audio_left=audio_left+16'h2000;
				audio_right=audio_right+16'h2000;
			end
			else begin
				audio_left=16'h1000;
				audio_right=16'h1000;
			end
		end
	end
*/
endmodule
