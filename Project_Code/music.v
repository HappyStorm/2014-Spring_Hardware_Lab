`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:32 06/23/2014 
// Design Name: 
// Module Name:    music 
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
module music(Audio_APPSEL, Audio_SYSCLK, Audio_BCK, Audio_WS, Audio_DATA, isfinish, Melody, pre_Melody, pp_Melody, ppp_Melody, pppp_Melody, mode_sel, valid, reset, clk);
	
	input reset, clk;
	input [1:0] mode_sel;
	input valid;

	wire [19:0] note_div;
	wire [15:0] audio_left; 	// left  sound audio
	wire [15:0] audio_right; 	// right sound audio
	wire clk_1Hz;
	wire clk_10Hz;
	wire clk_100Hz;

	output isfinish;
	output Audio_APPSEL; // playing mode selection
	output Audio_SYSCLK; // control clock for DAC (from crystal)
	output Audio_BCK; 	// bit clock of audio data (10MHz)
	output Audio_WS; 		// left/right parallel to serial control
	output Audio_DATA; 	// serial output audio data

	output [4:0] Melody;
	output [4:0] pre_Melody;
	output [4:0] pp_Melody;
	output [4:0] ppp_Melody;
	output [4:0] pppp_Melody;
	
	CLK_DIV_AUDIO clk_adivm0(.clock_100Hz(clk_100Hz), .clock_10Hz(clk_10Hz), .clock_1Hz(clk_1Hz), .clock_40MHz(clk));
	
	note_div_sel_song note(isfinish, note_div, Melody, pre_Melody, pp_Melody, ppp_Melody, pppp_Melody, mode_sel, valid, clk_10Hz, clk_1Hz, reset);
	
	note_generator generate_note(note_div, audio_left, audio_right, clk, reset);
	
	buzzer_control buzzer(Audio_APPSEL, Audio_SYSCLK, Audio_BCK, Audio_WS, Audio_DATA, clk, reset, audio_left, audio_right);

endmodule
