module pipe_move(clk, reset, pipe, pipe_position);

input logic clk, reset;
input logic [15:0][15:0] pipe;
output logic [15:0][15:0] pipe_position;

logic [15:0][15:0] curr_pipe;

always_ff @(posedge clk, posedge reset) begin

if (reset) begin
	curr_pipe <= pipe;
end else
	if (curr_pipe[00] == 16'b1000000000000000) curr_pipe <= pipe;
	else begin
		curr_pipe[00] <= curr_pipe[00] << 1;
		curr_pipe[01] <= curr_pipe[01] << 1;
		curr_pipe[02] <= curr_pipe[02] << 1;
		curr_pipe[03] <= curr_pipe[03] << 1;
		curr_pipe[04] <= curr_pipe[04] << 1;
		curr_pipe[05] <= curr_pipe[05] << 1;
		curr_pipe[06] <= curr_pipe[06] << 1;
		curr_pipe[07] <= curr_pipe[07] << 1;
		curr_pipe[08] <= curr_pipe[08] << 1;
		curr_pipe[09] <= curr_pipe[09] << 1;
		curr_pipe[10] <= curr_pipe[10] << 1;
		curr_pipe[11] <= curr_pipe[11] << 1;
		curr_pipe[12] <= curr_pipe[12] << 1;
		curr_pipe[13] <= curr_pipe[13] << 1;
		curr_pipe[14] <= curr_pipe[14] << 1;
		curr_pipe[15] <= curr_pipe[15] << 1;
	end
	pipe_position <= curr_pipe;
end
endmodule


module pipe_move_testbench();
logic clk, reset;
logic [15:0][15:0] pipe;
logic [15:0][15:0] pipe_position;
pipe_move dut (clk, reset, pipe, pipe_position);

parameter CLOCK_PERIOD=100;
initial begin
clk <= 0;
forever #(CLOCK_PERIOD/2) clk <= ~clk;
end

// Set up the inputs to the design. Each line is a clock cycle.
initial begin
reset <= 1; @(posedge clk); // Always reset FSMs at start
reset <= 0; @(posedge clk);
pipe[00] <= 16'b0000000000000000;
					pipe[01] <= 16'b0000000000000000;
					pipe[02] <= 16'b0000000000000000;
					pipe[03] <= 16'b0000000000000000;
					pipe[04] <= 16'b0000000000000001;
					pipe[05] <= 16'b0000000000000001;
					pipe[06] <= 16'b0000000000000001;
					pipe[07] <= 16'b0000000000000001;
					pipe[08] <= 16'b0000000000000001;
					pipe[09] <= 16'b0000000000000001;
					pipe[10] <= 16'b0000000000000001;
					pipe[11] <= 16'b0000000000000001;
					pipe[12] <= 16'b0000000000000001;
					pipe[13] <= 16'b0000000000000001;
					pipe[14] <= 16'b0000000000000001;
					pipe[15] <= 16'b0000000000000001; @(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
$stop; // End the simulation.
end
endmodule 