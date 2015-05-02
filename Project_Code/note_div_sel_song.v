`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:50 06/23/2014 
// Design Name: 
// Module Name:    note_div_sel_song 
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
module note_div_sel_song(isfinish, note_div, Melody, pre_Melody, pp_Melody, ppp_Melody, pppp_Melody, mode_sel, valid, clk_10Hz, clk_1Hz, reset);

	input clk_10Hz, clk_1Hz, reset;
	input valid;
	input [1:0] mode_sel;

	output reg isfinish = 1'b0;
	output reg [19:0] note_div;
	
	reg [19:0] count = 20'h0;
	reg [19:0] counter = 20'h0;
	reg [3:0] tmp = 4'h0;  		// storing the note to be decoded
	output reg [4:0] Melody = 5'h 0;
	output reg [4:0] pre_Melody = 5'h0;
	output reg [4:0] pp_Melody = 5'h0;
	output reg [4:0] ppp_Melody = 5'h0;
	output reg [4:0] pppp_Melody = 5'h0;
	
	always @(posedge clk_1Hz or negedge reset) begin
		if(!reset) begin
			Melody = 5'b 00000;
			pre_Melody = 5'b 00000;
			pp_Melody = 5'b 00000;
			ppp_Melody = 5'b 00000;
			pppp_Melody = 5'b 00000;
		end
		else begin
			Melody = {1'b0,tmp};
			pre_Melody = Melody;
			pp_Melody = pre_Melody;
			ppp_Melody = pp_Melody;
			pppp_Melody = ppp_Melody;
		end
	end
	
	always @(posedge clk_10Hz or negedge reset) begin	/*暫定easy-小星星 normal-天空之城*/
		if(!reset) begin 
			tmp <= 0;
			count = 0;
			counter = 0;
			note_div <= 0;
			isfinish = 0;
		end
		else begin
			if(valid) begin
				case(mode_sel)
					1: begin	//mode-->easy
						if(counter%3==0) begin	//根據節奏不同,counter%也不同
							case(count)
								0:tmp <= 4'h5;
								1:tmp <= 4'h3;
								2:tmp <= 4'h3;
								3:tmp <= 4'h0;
								4:tmp <= 4'h5;
								5:tmp <= 4'h2;
								6:tmp <= 4'h2;
								7:tmp <= 4'h0;
								8:tmp <= 4'h3;
								9:tmp <= 4'h2;
								10:tmp <= 4'h2;
								11:tmp <= 4'h1;
								12:tmp <= 4'h1;
								13:tmp <= 4'h0;
								//------
								14:tmp <= 4'h1;
								15:tmp <= 4'h7;
								16:tmp <= 4'h0;
								17:tmp <= 4'h6;
								18:tmp <= 4'h7;
								19:tmp <= 4'h1;
								20:tmp <= 4'h7;
								21:tmp <= 4'h1;
								22:tmp <= 4'h0;
								23:tmp <= 4'h1;
								24:tmp <= 4'h2;
								25:tmp <= 4'h3;
								26:tmp <= 4'h3;
								27:tmp <= 4'h0;
								//------
								28:tmp <= 4'h5;
								29:tmp <= 4'h3;
								30:tmp <= 4'h3;
								31:tmp <= 4'h0;
								32:tmp <= 4'h5;
								33:tmp <= 4'h2;
								34:tmp <= 4'h2;
								35:tmp <= 4'h0;
								36:tmp <= 4'h3;
								37:tmp <= 4'h2;
								38:tmp <= 4'h2;
								39:tmp <= 4'h1;
								40:tmp <= 4'h1;
								41:tmp <= 4'h0;
								//------
								42:tmp <= 4'h1;
								43:tmp <= 4'h7;
								44:tmp <= 4'h6;
								45:tmp <= 4'h7;
								46:tmp <= 4'h1;
								47:tmp <= 4'h7;
								48:tmp <= 4'h7;
								49:tmp <= 4'h1;
								50:tmp <= 4'h1;
								51:tmp <= 4'h2;
								52:tmp <= 4'h1;
								53:tmp <= 4'h0;
								//------
								//------
								//------
								//------
								54:tmp <= 4'h5;
								55:tmp <= 4'h3;
								56:tmp <= 4'h3;
								57:tmp <= 4'h0;
								58:tmp <= 4'h5;
								59:tmp <= 4'h2;
								60:tmp <= 4'h2;
								61:tmp <= 4'h0;
								62:tmp <= 4'h3;
								63:tmp <= 4'h2;
								64:tmp <= 4'h2;
								65:tmp <= 4'h1;
								66:tmp <= 4'h1;
								67:tmp <= 4'h0;
								//------
								68:tmp <= 4'h1;
								69:tmp <= 4'h7;
								70:tmp <= 4'h6;
								71:tmp <= 4'h7;
								72:tmp <= 4'h1;
								73:tmp <= 4'h7;
								74:tmp <= 4'h7;
								75:tmp <= 4'h1;
								76:tmp <= 4'h1;
								77:tmp <= 4'h0;
								78:tmp <= 4'h2;
								79:tmp <= 4'h3;
								80:tmp <= 4'h0;
								//------
								81:tmp <= 4'h5;
								82:tmp <= 4'h3;
								83:tmp <= 4'h3;
								84:tmp <= 4'h0;
								85:tmp <= 4'h5;
								86:tmp <= 4'h9;
								87:tmp <= 4'h9;
								88:tmp <= 4'h0;
								89:tmp <= 4'h1;
								90:tmp <= 4'h7;
								91:tmp <= 4'h7;
								92:tmp <= 4'h8;
								93:tmp <= 4'h8;
								94:tmp <= 4'h0;
								//------
								95:tmp <= 4'h1;
								96:tmp <= 4'h7;
								97:tmp <= 4'h6;
								98:tmp <= 4'h7;
								99:tmp <= 4'h1;
								100:tmp <= 4'h7;
								101:tmp <= 4'h7;
								102:tmp <= 4'h1;
								103:tmp <= 4'h1;
								104:tmp <= 4'h2;
								105:tmp <= 4'h1;
								106:tmp <= 4'h0;
								//------
								107:tmp <= 4'h0;
								108:tmp <= 4'h5;
								109:tmp <= 4'h6;
								110:tmp <= 4'h7;
								111:tmp <= 4'h8;
								112:tmp <= 4'h0;
								113:tmp <= 4'h7;
								114:tmp <= 4'h8;
								115:tmp <= 4'h7;
								116:tmp <= 4'h6;
								117:tmp <= 4'h5;
								118:tmp <= 4'h6;
								119:tmp <= 4'h6;
								120:tmp <= 4'h5;
								121:tmp <= 4'h5;
								122:tmp <= 4'h5;
								123:tmp <= 4'h0;
								//------
								124:tmp <= 4'h1;
								125:tmp <= 4'h2;
								126:tmp <= 4'h3;
								127:tmp <= 4'h4;
								128:tmp <= 4'h0;
								129:tmp <= 4'h3;
								130:tmp <= 4'h4;
								131:tmp <= 4'h5;
								132:tmp <= 4'h1;
								133:tmp <= 4'h2;
								134:tmp <= 4'h3;
								135:tmp <= 4'h3;
								136:tmp <= 4'h0;
								137:tmp <= 4'h3;
								138:tmp <= 4'h3;
								139:tmp <= 4'h0;
								//------
								140:tmp <= 4'h0;
								141:tmp <= 4'h5;
								142:tmp <= 4'h6;
								143:tmp <= 4'h7;
								144:tmp <= 4'h8;
								145:tmp <= 4'h7;
								146:tmp <= 4'h8;
								147:tmp <= 4'h9;
								148:tmp <= 4'h8;
								149:tmp <= 4'h9;
								150:tmp <= 4'ha;
								151:tmp <= 4'ha;
								152:tmp <= 4'h5;
								153:tmp <= 4'h5;
								154:tmp <= 4'h0;
								//------
								155:tmp <= 4'h1;
								156:tmp <= 4'h2;
								157:tmp <= 4'h3;
								158:tmp <= 4'h4;
								159:tmp <= 4'h0;
								160:tmp <= 4'h3;
								161:tmp <= 4'h4;
								162:tmp <= 4'h3;
								163:tmp <= 4'h2;
								164:tmp <= 4'h2;
								165:tmp <= 4'h0;
								166:tmp <= 4'h1;
								167:tmp <= 4'h7;
								168:tmp <= 4'h1;
								169:tmp <= 4'h1;
								170:tmp <= 4'h0;
								//------
								171:tmp <= 4'h0;
								172:tmp <= 4'h5;
								173:tmp <= 4'h6;
								174:tmp <= 4'h7;
								175:tmp <= 4'h8;
								176:tmp <= 4'h0;
								177:tmp <= 4'h7;
								178:tmp <= 4'h8;
								179:tmp <= 4'h9;
								180:tmp <= 4'h8;
								181:tmp <= 4'h7;
								182:tmp <= 4'h6;
								183:tmp <= 4'h6;
								184:tmp <= 4'h5;
								185:tmp <= 4'h5;
								186:tmp <= 4'h0;
								//------
								187:tmp <= 4'h1;
								188:tmp <= 4'h2;
								189:tmp <= 4'h3;
								190:tmp <= 4'h4;
								191:tmp <= 4'h0;
								192:tmp <= 4'h3;
								193:tmp <= 4'h4;
								194:tmp <= 4'h5;
								195:tmp <= 4'h1;
								196:tmp <= 4'h1;
								197:tmp <= 4'h6;
								198:tmp <= 4'h6;
								199:tmp <= 4'h5;
								200:tmp <= 4'h5;
								201:tmp <= 4'h0;
								//------
								202:tmp <= 4'h0;
								203:tmp <= 4'h5;
								204:tmp <= 4'h6;
								205:tmp <= 4'h7;
								206:tmp <= 4'h8;
								207:tmp <= 4'h0;
								208:tmp <= 4'h7;
								209:tmp <= 4'h8;
								210:tmp <= 4'h9;
								211:tmp <= 4'h8;
								212:tmp <= 4'h9;
								213:tmp <= 4'ha;
								214:tmp <= 4'ha;
								215:tmp <= 4'h0;
								216:tmp <= 4'h5;
								217:tmp <= 4'h5;
								218:tmp <= 4'h0;
								//------
								219:tmp <= 4'h0;
								220:tmp <= 4'h1;
								221:tmp <= 4'h2;
								222:tmp <= 4'h3;
								223:tmp <= 4'h4;
								224:tmp <= 4'h0;
								225:tmp <= 4'h3;
								226:tmp <= 4'h4;
								227:tmp <= 4'h5;
								228:tmp <= 4'h1;
								229:tmp <= 4'h1;
								230:tmp <= 4'h0;
								231:tmp <= 4'h2;
								232:tmp <= 4'h2;
								233:tmp <= 4'h1;
								234:tmp <= 4'h0;
								//------
								235:tmp <= 4'h0;
								236:tmp <= 4'h5;
								237:tmp <= 4'h6;
								238:tmp <= 4'h7;
								239:tmp <= 4'h8;
								240:tmp <= 4'h0;
								241:tmp <= 4'h7;
								242:tmp <= 4'h8;
								243:tmp <= 4'h7;
								244:tmp <= 4'h6;
								245:tmp <= 4'h0;
								246:tmp <= 4'h5;
								247:tmp <= 4'h4;
								248:tmp <= 4'h4;
								249:tmp <= 4'h5;
								250:tmp <= 4'h5;
								251:tmp <= 4'h0;
								//------
								default:tmp <= 4'h0;
							endcase
							count = count+1;
							if(count==48) isfinish = 1'b1;
						end //if 的 end	
						else tmp <= 4'h0;	//這邊用 tmp <= 4'h0 是因為小星星節奏感和天空之城不一樣
					end
					2:begin	//天空之城
						if(counter%2==0) begin
							case(count) 
							// 1-th
								0:tmp <= 4'h0;
								1:tmp <= 4'h6;
								2:tmp <= 4'h7;
								3:tmp <= 4'h8;
								4:tmp <= 4'h8;
								5:tmp <= 4'h8;
								6:tmp <= 4'h7;
								7:tmp <= 4'h8;
								8:tmp <= 4'h8;
								9:tmp <= 4'ha;
								10:tmp <= 4'ha;
								11:tmp <= 4'h7;
								12:tmp <= 4'h7;
								13:tmp <= 4'h7;
								14:tmp <= 4'h7;
								15:tmp <= 4'h7;
								16:tmp <= 4'h7;
								17:tmp <= 4'h0;
							// 2-th
								18:tmp <= 4'h3;
								19:tmp <= 4'h3;
								20:tmp <= 4'h6;
								21:tmp <= 4'h6;
								22:tmp <= 4'h5;
								23:tmp <= 4'h6;
								24:tmp <= 4'h6;
								25:tmp <= 4'h8;
								26:tmp <= 4'h8;
								27:tmp <= 4'h5;
								28:tmp <= 4'h5;
								29:tmp <= 4'h5;
								30:tmp <= 4'h5;
								31:tmp <= 4'h5;
								32:tmp <= 4'h5;
								33:tmp <= 4'h0;
							// 3-th
								34:tmp <= 4'h3;
								35:tmp <= 4'h3;
								36:tmp <= 4'h4;
								37:tmp <= 4'h4;
								38:tmp <= 4'h4;
								39:tmp <= 4'h3;
								40:tmp <= 4'h4;
								41:tmp <= 4'h8;
								42:tmp <= 4'h8;
								43:tmp <= 4'h8;
								44:tmp <= 4'h3;
								45:tmp <= 4'h3;
								46:tmp <= 4'h3;
								47:tmp <= 4'h3;
								48:tmp <= 4'h3;
								49:tmp <= 4'h0;
							// 4-th
								50:tmp <= 4'h8;
								51:tmp <= 4'h8;
								52:tmp <= 4'h8;
								53:tmp <= 4'h7;
								54:tmp <= 4'h7;
								55:tmp <= 4'h7;
								56:tmp <= 4'hd;
								57:tmp <= 4'hd;
								58:tmp <= 4'hd;
								59:tmp <= 4'h7;
								60:tmp <= 4'h7;
								61:tmp <= 4'h7;
								62:tmp <= 4'h7;
								63:tmp <= 4'h7;
								64:tmp <= 4'h7;
								65:tmp <= 4'h7;
								66:tmp <= 4'h7;
								67:tmp <= 4'h0;
							// 5-th
								68:tmp <= 4'h0;
								69:tmp <= 4'h6;
								70:tmp <= 4'h7;
								71:tmp <= 4'h8;
								72:tmp <= 4'h8;
								73:tmp <= 4'h8;
								74:tmp <= 4'h7;
								75:tmp <= 4'h8;
								76:tmp <= 4'h8;
								77:tmp <= 4'ha;
								78:tmp <= 4'ha;
								79:tmp <= 4'h7;
								80:tmp <= 4'h7;
								81:tmp <= 4'h7;
								82:tmp <= 4'h7;
								83:tmp <= 4'h7;
								84:tmp <= 4'h7;
								85:tmp <= 4'h0;
							// 6-th
								86:tmp <= 4'h3;
								87:tmp <= 4'h3;
								88:tmp <= 4'h6;
								89:tmp <= 4'h6;
								90:tmp <= 4'h5;
								91:tmp <= 4'h6;
								92:tmp <= 4'h6;
								93:tmp <= 4'h8;
								94:tmp <= 4'h8;
								95:tmp <= 4'h5;
								96:tmp <= 4'h5;
								97:tmp <= 4'h5;
								98:tmp <= 4'h5;
								99:tmp <= 4'h5;
								100:tmp <= 4'h5;
								101:tmp <= 4'h0;
							// 7-th
								102:tmp <= 4'h3;
								103:tmp <= 4'h3;
								104:tmp <= 4'h4;
								105:tmp <= 4'h4;
								106:tmp <= 4'h8;
								107:tmp <= 4'h7;
								108:tmp <= 4'h7;
								109:tmp <= 4'h7;
								110:tmp <= 4'h8;
								111:tmp <= 4'h8;
								112:tmp <= 4'h9;
								113:tmp <= 4'h9;
								114:tmp <= 4'ha;
								115:tmp <= 4'h8;
								116:tmp <= 4'h8;
								117:tmp <= 4'h8;
								118:tmp <= 4'h8;
								119:tmp <= 4'h8;
								120:tmp <= 4'h0;
							// 8-th
								121:tmp <= 4'h8;
								122:tmp <= 4'h7;
								123:tmp <= 4'h6;
								124:tmp <= 4'h6;
								125:tmp <= 4'h7;
								126:tmp <= 4'h7;
								127:tmp <= 4'he;
								128:tmp <= 4'he;
								129:tmp <= 4'h6;
								130:tmp <= 4'h6;
								131:tmp <= 4'h6;
								132:tmp <= 4'h6;
								133:tmp <= 4'h6;
								134:tmp <= 4'h6;
								135:tmp <= 4'h0;
								default:tmp <= 4'h0;
							endcase
							count = count+1;
							if(count==135) isfinish = 1'b1;
						end//if 的 end
						else note_div <= 20'd0;
					end
					3:begin	//情非得已
						if(counter%2==0) begin
							case(count) 
								0:tmp <= 4'h0;
								1:tmp <= 4'h3;	// 難
								2:tmp <= 4'h4;	// 以
								3:tmp <= 4'h5;	// 忘
								4:tmp <= 4'h4;	// 記
								5:tmp <= 4'h5;	// 初
								6:tmp <= 4'h4;	// 次
								7:tmp <= 4'h3;	// 見
								8:tmp <= 4'h2;	// 你
								9:tmp <= 4'h2;
								10:tmp <= 4'h2;
								11:tmp <= 4'h0;
								12:tmp <= 4'h0;
								13:tmp <= 4'h3;	// 一
								14:tmp <= 4'h2;	// 雙
								15:tmp <= 4'h1;	// 迷
								16:tmp <= 4'h0;
								17:tmp <= 4'h1;	// 人
								18:tmp <= 4'h8;	// 的
								19:tmp <= 4'h8;	
								20:tmp <= 4'h3;	// 眼
								21:tmp <= 4'h5;	// 睛
								22:tmp <= 4'h5;
								23:tmp <= 4'h5; 
								24:tmp <= 4'h5; 
								25:tmp <= 4'h0;
								26:tmp <= 4'h0;
								27:tmp <= 4'h0;
								28:tmp <= 4'h1;	// 在
								29:tmp <= 4'h2;	// 腦
								30:tmp <= 4'h2;
								31:tmp <= 4'h1;	// 海
								32:tmp <= 4'h1;	// 裡
								33:tmp <= 4'h0;
								34:tmp <= 4'h8;	// 你
								35:tmp <= 4'h7;	// 的
								36:tmp <= 4'h7;
								37:tmp <= 4'h6;	// 身
								38:tmp <= 4'h6;
								39:tmp <= 4'h5;	// 影
								40:tmp <= 4'h5;
								41:tmp <= 4'h0;
								42:tmp <= 4'h1;	// 揮
								43:tmp <= 4'h2;	// 散
								44:tmp <= 4'h2;	
								45:tmp <= 4'h3;	// 不
								46:tmp <= 4'h4;	
								47:tmp <= 4'h4;	
								48:tmp <= 4'h2;	// 去
								49:tmp <= 4'h2;
								50:tmp <= 4'h2;
								51:tmp <= 4'h2;
								52:tmp <= 4'h0;
								53:tmp <= 4'h0;
								54:tmp <= 4'h0;
								55:tmp <= 4'h0;
								56:tmp <= 4'h3;	// 握
								57:tmp <= 4'h4;	// 的
								58:tmp <= 4'h5;	// 雙
								59:tmp <= 4'h4;	// 手
								60:tmp <= 4'h3;	// 感	
								61:tmp <= 4'h4;	// 覺
								62:tmp <= 4'h5;	// 你
								63:tmp <= 4'h5;
								64:tmp <= 4'h6;	// 的
								65:tmp <= 4'h3;	// 溫
								66:tmp <= 4'h3;
								67:tmp <= 4'h2;	// 柔
								68:tmp <= 4'h2;
								69:tmp <= 4'h0;
								70:tmp <= 4'h0;
								71:tmp <= 4'h0;
								72:tmp <= 4'h3;	// 真
								73:tmp <= 4'h2;	// 的
								74:tmp <= 4'h1;	// 有
								75:tmp <= 4'h0;
								76:tmp <= 4'h1;	// 點
								77:tmp <= 4'h7;	// 透
								78:tmp <= 4'h7;
								79:tmp <= 4'h8;	// 不
								80:tmp <= 4'h3;	// 過
								81:tmp <= 4'h5;	// 氣
								82:tmp <= 4'h5;
								83:tmp <= 4'h5;
								84:tmp <= 4'h0;
								85:tmp <= 4'h0;
								86:tmp <= 4'h0;
								87:tmp <= 4'h5;	// 你
								88:tmp <= 4'h6;	// 的*
								89:tmp <= 4'h6;
								90:tmp <= 4'h7;	// 天
								91:tmp <= 4'h8;	// 真
								92:tmp <= 4'h8;
								93:tmp <= 4'h8;
								94:tmp <= 4'h0;
								95:tmp <= 4'h0;
								96:tmp <= 4'h0;
								97:tmp <= 4'h9;	// 我
								98:tmp <= 4'h7;	// 想
								99:tmp <= 4'h7;
								100:tmp <= 4'h6;	// 珍
								101:tmp <= 4'h5;	// 惜
								102:tmp <= 4'h5;
								103:tmp <= 4'h0;
								104:tmp <= 4'h0;
								105:tmp <= 4'h0;
								106:tmp <= 4'h5;	// 看
								107:tmp <= 4'h5;	// 到	
								108:tmp <= 4'h6;	// 你
								109:tmp <= 4'h8;	// 受
								110:tmp <= 4'h8;	// 委
								111:tmp <= 4'h6;	// 曲
								112:tmp <= 4'h8;	// 我
								113:tmp <= 4'h6;	// 會
								114:tmp <= 4'h8;	// 傷
								115:tmp <= 4'h9;	// 心
								116:tmp <= 4'h9;
								117:tmp <= 4'h9;
								118:tmp <= 4'h9;
								119:tmp <= 4'h0;
								120:tmp <= 4'h0;
								121:tmp <= 4'h0;
								122:tmp <= 4'h5;	// 只
								123:tmp <= 4'h8;	// 怕
								124:tmp <= 4'h9;	// 我
								125:tmp <= 4'ha;	// 自
								126:tmp <= 4'h9;	// 己
								127:tmp <= 4'h8;	// 會
								128:tmp <= 4'h8;	// 愛
								129:tmp <= 4'h8;	// 上
								130:tmp <= 4'hc;	// 你
								131:tmp <= 4'hc;
								132:tmp <= 4'hc;
								133:tmp <= 4'hc;
								134:tmp <= 4'hc;
								135:tmp <= 4'h0;
								136:tmp <= 4'h0;
								137:tmp <= 4'h0;
								138:tmp <= 4'ha;	// 不
								139:tmp <= 4'hc;	// 敢
								140:tmp <= 4'hc;	// 讓
								141:tmp <= 4'ha;	// 自
								142:tmp <= 4'ha;	// 己
								143:tmp <= 4'h9;	// 靠
								144:tmp <= 4'ha;	// 得
								145:tmp <= 4'ha;
								146:tmp <= 4'hb;	// 太
								147:tmp <= 4'ha;	// 近
								148:tmp <= 4'ha;
								149:tmp <= 4'h0;
								150:tmp <= 4'h0;	
								151:tmp <= 4'ha;	// 怕
								152:tmp <= 4'h9;	// 我
								153:tmp <= 4'h9;
								154:tmp <= 4'h8;	// 沒
								155:tmp <= 4'h8;
								156:tmp <= 4'h6;	// 能	
								157:tmp <= 4'h8;	// 夠
								158:tmp <= 4'h9;	// 給
								159:tmp <= 4'h6;	// 你
								160:tmp <= 4'h6;
								161:tmp <= 4'h5;
								162:tmp <= 4'h5;
								163:tmp <= 4'h0;
								164:tmp <= 4'h0;
								165:tmp <= 4'h5;	// 愛
								166:tmp <= 4'h5;	// 你
								167:tmp <= 4'h6;	// 也
								168:tmp <= 4'h8;	// 需
								169:tmp <= 4'h6;	// 要
								170:tmp <= 4'h6;	// 很
								171:tmp <= 4'h8;	// 大 
								172:tmp <= 4'h6;	// 的
								173:tmp <= 4'h8;	// 勇
								174:tmp <= 4'h9;	// 氣
								175:tmp <= 4'h9;
								176:tmp <= 4'h0;
								177:tmp <= 4'h0;
								178:tmp <= 4'h0;
								179:tmp <= 4'h5;	// 只
								180:tmp <= 4'h8;	// 怕
								181:tmp <= 4'h9;	// 我
								182:tmp <= 4'ha;	// 自
								183:tmp <= 4'h9;	// 己
								184:tmp <= 4'h9;	// 會
								185:tmp <= 4'h8;	// 愛
								186:tmp <= 4'h8;	// 上
								187:tmp <= 4'hc;	// 你
								188:tmp <= 4'hc;
								189:tmp <= 4'hc;
								190:tmp <= 4'h0;
								191:tmp <= 4'h0;
								192:tmp <= 4'h0;
								193:tmp <= 4'h0;
								194:tmp <= 4'ha;	// 也
								195:tmp <= 4'hc;	// 許
								196:tmp <= 4'hc;	// 有
								197:tmp <= 4'ha;	// 天
								198:tmp <= 4'ha;	// 會
								199:tmp <= 4'h9;	
								200:tmp <= 4'ha;
								201:tmp <= 4'ha;
								202:tmp <= 4'hb;
								203:tmp <= 4'ha;
								204:tmp <= 4'ha;
								205:tmp <= 4'ha;
								206:tmp <= 4'ha;
								207:tmp <= 4'ha;
								208:tmp <= 4'h0;
								209:tmp <= 4'h0;
								210:tmp <= 4'h0;
								211:tmp <= 4'h0;
								212:tmp <= 4'ha;
								213:tmp <= 4'h9;
								214:tmp <= 4'h8;
								215:tmp <= 4'h8;
								216:tmp <= 4'h8;
								217:tmp <= 4'h6;
								218:tmp <= 4'h8;
								219:tmp <= 4'h8;
								220:tmp <= 4'h9;
								221:tmp <= 4'h6;
								222:tmp <= 4'h6;
								223:tmp <= 4'h5;
								224:tmp <= 4'h5;
								225:tmp <= 4'h0;
								226:tmp <= 4'h0;
								227:tmp <= 4'h0;
								228:tmp <= 4'h5;
								229:tmp <= 4'h5;
								230:tmp <= 4'h6;
								231:tmp <= 4'h8;
								232:tmp <= 4'h8;
								233:tmp <= 4'h6;
								234:tmp <= 4'ha;
								235:tmp <= 4'h9;
								236:tmp <= 4'h9;
								237:tmp <= 4'h8;
								238:tmp <= 4'h8;
								239:tmp <= 4'h8;
								240:tmp <= 4'h0;
								241:tmp <= 4'h0;
								242:tmp <= 4'h0;
								243:tmp <= 4'h0;
								244:tmp <= 4'h5;
								245:tmp <= 4'h5;
								246:tmp <= 4'h6;
								247:tmp <= 4'h8;
								248:tmp <= 4'h8;
								249:tmp <= 4'h6;
								250:tmp <= 4'ha;
								251:tmp <= 4'h9;
								252:tmp <= 4'h9;
								253:tmp <= 4'h8;
								254:tmp <= 4'h8;
								255:tmp <= 4'h8;
								256:tmp <= 4'h8;
								257:tmp <= 4'h8;
								258:tmp <= 4'h8;
								259:tmp <= 4'h8;
								260:tmp <= 4'h0;
								261:tmp <= 4'h0;
								default:tmp <= 4'h0;
							endcase
							count = count+1;
							if(count==272) isfinish = 1'b1;
						end//if 的 end
						else note_div <= 20'd0;
					end
					default: tmp <= 4'h0;
				endcase 	//sel_song 的endcase
				
				// 這邊是發出頻率的轉換
				case(tmp)
					4'h0: note_div <= 20'd0;
					4'h1:	note_div <= 20'd76628; // mid_do 1
					4'h2:	note_div <= 20'd68259; // mid_re 2
					4'h3:	note_div <= 20'd60606; // mid_mi 3
					4'h4:	note_div <= 20'd57306; // mid_fa 4
					4'h5:	note_div <= 20'd51020; // mid_so 5
					4'h6:	note_div <= 20'd45454; // mid_la 6
					4'h7:	note_div <= 20'd40485; // mid_si 7
					4'h8: note_div <= 20'd38240; // high_do .1
					4'h9: note_div <= 20'd34071; // high_re .2
					4'ha: note_div <= 20'd30349; // high_mi .3
					4'hb: note_div <= 20'd28653; // high_fa .4
					4'hc: note_div <= 20'd25542; // high_so .5
					4'hd: note_div <= 20'd54054; // mid_#fa #.4
					4'he: note_div <= 20'd48192; // mid_#so #.5
					default: note_div <= 20'd0;
				endcase
				counter = counter+1;	//只有這邊要+1，這個是整個always +1的地方
			end
			else begin
			end
		end
	end	//<--always 的end

endmodule
