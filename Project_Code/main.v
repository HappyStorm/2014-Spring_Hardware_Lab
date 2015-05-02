`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:14:15 06/23/2014 
// Design Name: 
// Module Name:    main 
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
module main(Audio_APPSEL, Audio_SYSCLK, Audio_BCK, Audio_WS, Audio_DATA, DIGIT, DISPLAY, ROW, LCD_ENABLE, LCD_RW, LCD_DI, LCD_CS1, LCD_CS2, LCD_RST, LCD_DATA, COLUMN, reset, clk);
	
	input	reset, clk;
	input [3:0] COLUMN;
	
	// LCD output
	output LCD_ENABLE, LCD_RW, LCD_DI, LCD_CS1, LCD_CS2, LCD_RST;
	output [7:0] LCD_DATA;
	output [3:0] ROW;
	output [3:0] DIGIT;
	output [7:0] DISPLAY;
	
	
//// Audio output
	output Audio_APPSEL; // playing mode selection
	output Audio_SYSCLK; // control clock for DAC (from crystal)
	output Audio_BCK; 	// bit clock of audio data (10MHz)
	output Audio_WS; 		// left/right parallel to serial control
	output Audio_DATA; 	// serial output audio data
//	
//// LED light output
//	output [15:0] LED;
	
	
// Clock wires
	wire clk_LCD;
	wire clk_7seg;
	wire clk_1s;
	wire clk_500ms;
	wire clk_1us;
//	wire clk_1MHz;
	wire clk_100KHz;
//	wire clk_10KHz;
//	wire clk_1KHz;
	wire clk_100Hz;
	wire clk_10Hz;
	wire clk_1Hz;
	
// Graph wires
	wire [0:4095] LEFT_GRAPH;
	wire [0:4095] RIGHT_GRAPH;
	wire [0:4095] GL;
	wire [0:4095] GR;
	
// Signal wires
	wire reset_db;	
	wire press;
	wire isfinish;
	
// Data wires
	wire [4:0] KEY_IN;
	wire [1:0] mode_sel;
	wire LCD_state;
//	wire [3:0] random_num;
	wire [3:0] score_tens;
	wire [3:0] score_unit;
	wire [4:0] Melody;
	wire [4:0] pre_Melody;
	wire [4:0] pp_Melody;
	wire [4:0] ppp_Melody;
	wire [4:0] pppp_Melody;
	
// Data registers
	reg Menu_state = 0;
	reg [1:0] Mode_state = 2'b00;
//	reg [3:0] KEY_PRE = 0;
//	wire [0:4095] temp_L;
//	wire [0:4095] temp_R;
	
//	Clock Divider
	CLK_DIV clk_ndiv0(.clk_7seg(clk_7seg), .clk(clk));
	CLK_DIV clk_ndiv1(.clk_1us(clk_1us), .clk(clk));
	CLK_DIV clk_ndiv2(.clk_500ms(clk_500ms), .clk(clk));
	CLK_DIV clk_ndiv3(.clk_1s(clk_1s), .clk(clk));
	CLK_DIV clk_ndiv(.clk_LCD(clk_LCD), .clk(clk));
	CLK_DIV_AUDIO clk_adiv0(.clock_100KHz(clk_100KHz),  .clock_40MHz(clk));
	CLK_DIV_AUDIO clk_adiv1(.clock_10Hz(clk_10Hz), .clock_40MHz(clk));
	CLK_DIV_AUDIO clk_adiv2(.clock_1Hz(clk_1Hz), .clock_40MHz(clk));
	CLK_DIV_AUDIO clk_adiv3(.clock_100Hz(clk_100Hz), .clock_40MHz(clk));
//	CLK_DIV_AUDIO clk_adiv2(.clock_10KHz(clk_10KHz), .clock_40MHz(clk));
	
// Debounce Reset
	debounce DB0(reset_db, reset, clk_1us);
	
	
//	KeyBoard Control
	KeyBoard_ctrl KB_ctrl(ROW, KEY_IN, press, COLUMN, clk, reset_db);
	
	
//	LCD Display Control
	LCD_DISPLAY_CTRL LCD_ctrl(LEFT_GRAPH, RIGHT_GRAPH, GL, GR, LCD_state, mode_sel, reset_db, clk_LCD, clk_10Hz, clk_100Hz);
	
	
//	LCD Display
	LCD_DISPLAY LCD_display(LEFT_GRAPH, RIGHT_GRAPH, clk_100KHz, reset_db, LCD_DATA, LCD_ENABLE, LCD_RW, LCD_RST, LCD_CS1, LCD_CS2, LCD_DI);

// 7-seg LED light
	LED7SEG LED_7seg(DIGIT, DISPLAY, score_tens, score_unit, clk_7seg);

// Game module
	//TAIKO_CONTROL Taiko_ctrl(GL, GR, score_tens, score_unit, Melody, KEY_IN, press, reset_db, clk);
	TAIKO_CONTROL Taiko_ctrl(GL, GR, score_tens, score_unit, Melody, pre_Melody, pp_Melody, ppp_Melody, pppp_Melody, KEY_IN, press, isfinish, Menu_state, reset_db, clk_1Hz, clk_10Hz, clk_500ms, clk_100KHz, clk_1s, clk_1us, clk);
	
// Sound Control
	music Music_Player(Audio_APPSEL, Audio_SYSCLK, Audio_BCK, Audio_WS, Audio_DATA, isfinish, Melody, pre_Melody, pp_Melody, ppp_Melody, pppp_Melody, mode_sel, LCD_state, reset_db, clk);
	
	// Control the state
	always @(posedge clk or negedge reset) begin
		if(!reset) begin
			Menu_state <= 0;
			Mode_state <= 0;
		end
		else begin
			if(Menu_state==0) begin
				if(Mode_state==0) begin
					if(KEY_IN==5'b00100)
						Mode_state <= 3;
					else if(KEY_IN==5'b00110)
						Mode_state <= 1;
					else begin
					end
				end
				else if(Mode_state==1) begin
					if(KEY_IN==5'b00100)
						Mode_state <= 3;
					else if(KEY_IN==5'b00110)
						Mode_state <= 2;
					else if(KEY_IN==5'b00101)
						Menu_state <= 1;
					else begin
					end
				end
				else if(Mode_state==2) begin
					if(KEY_IN==5'b00100)
						Mode_state <= 1;
					else if(KEY_IN==5'b00110)
						Mode_state <= 3;
					else if(KEY_IN==5'b00101)
						Menu_state <= 1;
					else begin
					end
				end
				else  begin
					if(KEY_IN==5'b00100)
						Mode_state <= 2;
					else if(KEY_IN==5'b00110)
						Mode_state <= 1;
					else if(KEY_IN==5'b00101)
						Menu_state <= 1;
					else begin
					end
				end
			end
			else begin
			end
		end
	end
	
	assign LCD_state = Menu_state;
	assign mode_sel  = Mode_state;
	
endmodule
