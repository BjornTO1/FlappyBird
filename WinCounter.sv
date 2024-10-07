module WinCounter (Clock, Reset, lwin, lno, Light, hexDisplay);
input logic Clock, Reset, lwin, lno, Light;
output logic [6:0] hexDisplay;

enum {hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7} ps, ns;

always_comb begin 
	case(ps)
		hex0: if (Light & lwin & ~lno) ns = hex1;
				else ns = hex0;
		hex1: if (Light & lwin & ~lno) ns = hex2;
				else ns = hex1;
		hex2: if (Light & lwin & ~lno) ns = hex3;
				else ns = hex2;
		hex3: if (Light & lwin & ~lno) ns = hex4;
				else ns = hex3;
		hex4: if (Light & lwin & ~lno) ns = hex5;
				else ns = hex4;
		hex5: if (Light & lwin & ~lno) ns = hex6;
				else ns = hex5;
		hex6: if (Light & lwin & ~lno) ns = hex7;
				else ns = hex6;
		hex7: if (Light & lwin & ~lno) ns = hex7;
				else ns = hex7;
	endcase
end

always_comb begin
	case(ps)
		hex0: hexDisplay = 7'b1000000;
		hex1: hexDisplay = 7'b1111001;
		hex2: hexDisplay = 7'b0100100;
		hex3: hexDisplay = 7'b0110000;
		hex4: hexDisplay = 7'b0011001;
		hex5: hexDisplay = 7'b0010010;
		hex6: hexDisplay = 7'b0000010;
		hex7: hexDisplay = 7'b1111000;
	endcase
end

always_ff @ (posedge Clock) begin
if (Reset)
ps <= hex0;
else
ps <= ns;
end

endmodule

module WinCounter_testbench();

logic clk, reset, lwin, lno, Light;
logic [6:0] seg;
WinCounter dut (clk, reset, lwin, lno, Light, seg);

parameter CLOCK_PERIOD=100;
initial begin
clk <= 0;
forever #(CLOCK_PERIOD/2) clk <= ~clk;
end

// Set up the inputs to the design. Each line is a clock cycle.
initial begin
reset <= 1; @(posedge clk); // Always reset FSMs at start
reset <= 0; @(posedge clk);
lwin <= 0; lno <= 0; Light <= 0; @(posedge clk);
@(posedge clk);
reset <= 1; @(posedge clk);
reset <= 0; @(posedge clk);
@(posedge clk);
lwin <= 1; lno <= 0; Light <= 1; @(posedge clk);
@(posedge clk);
lwin <= 1; lno <= 0; Light <= 1; @(posedge clk);
@(posedge clk);
lwin <= 1; lno <= 0; Light <= 1; @(posedge clk);
@(posedge clk);
lwin <= 1; lno <= 0; Light <= 1; @(posedge clk);
@(posedge clk);
lwin <= 1; lno <= 0; Light <= 1; @(posedge clk);
@(posedge clk);
lwin <= 1; lno <= 0; Light <= 1; @(posedge clk);
@(posedge clk);
reset <= 1; @(posedge clk);
reset <= 0; @(posedge clk);
@(posedge clk);

$stop; // End the simulation.
end
endmodule 
	