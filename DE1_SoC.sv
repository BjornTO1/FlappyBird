// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
    output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	 output logic [9:0]  LEDR;
    input  logic [3:0]  KEY;
    input  logic [9:0]  SW;
    output logic [35:0] GPIO_1;
    input logic CLOCK_50;

	 // Turn off HEX displays
    assign HEX0 = '1;
    assign HEX1 = '1;
    assign HEX2 = '1;
    assign HEX3 = '1;
    assign HEX4 = '1;
    assign HEX5 = '1;
	 
	 
	 /* Set up system base clock to 1526 Hz (50 MHz / 2**(14+1))
	    ===========================================================*/
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK;
	 logic BIRD_CLOCK;
	 
	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
	 
	 assign SYSTEM_CLOCK = clk[14]; // 1526 Hz clock signal	
	 assign BIRD_CLOCK = clk[22]; 
	 assign PIPE_CLOCK = clk[23];
	 
	 /* If you notice flickering, set SYSTEM_CLOCK faster.
	    However, this may reduce the brightness of the LED board. */
	
	 
	 /* Set up LED board driver
	    ================================================================== */
	 logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
    logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 logic RST;                   // reset - toggle this on startup
	 
	 assign RST = SW[9];
	 
	 /* Standard LED Driver instantiation - set once and 'forget it'. 
	    See LEDDriver.sv for more info. Do not modify unless you know what you are doing! */
	 LEDDriver Driver (.CLK(SYSTEM_CLOCK), .RST, .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);
	 
	 
	 /* LED board test submodule - paints the board with a static pattern.
	    Replace with your own code driving RedPixels and GrnPixels.
		 
	 	 KEY0      : Reset
		 =================================================================== */
	 // LED_test test (.RST(~KEY[0]), .RedPixels, .GrnPixels);
	 logic userinput;
	 logic [3:0] random;
	 logic [15:0][15:0] rand_pipe;
	 logic gameover;
	 logic restart;
	 logic winner;
	 
	 dflipflop in (BIRD_CLOCK, RST, ~KEY[0], userinput);
	 bird_position pos (BIRD_CLOCK, RST | restart, userinput, RedPixels);
	 LFSR rando (SYSTEM_CLOCK, RST, random);
	 rand_pipe pipe (random, rand_pipe);
	 pipe_move out_pipe (PIPE_CLOCK, RST | restart, rand_pipe, GrnPixels);
	 game_over done (RedPixels, GrnPixels, gameover, winner);
	 
	 always_ff @(posedge PIPE_CLOCK) begin
		if (gameover && !userinput)
			restart <= 1'b1;
		else
			restart <= 1'b0;
	 end
	 
	 
endmodule