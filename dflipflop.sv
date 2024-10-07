module dflipflop ( input logic clk, reset, button, output logic out);

logic meta;

always_ff @ (posedge clk, posedge reset) begin
meta <= button;
out <= meta;
end

endmodule

module dflipflop_testbench();
logic clk, reset, button;
logic out;
dflipflop dut (clk, reset, button, out);

parameter CLOCK_PERIOD=100;
initial begin
clk <= 0;
forever #(CLOCK_PERIOD/2) clk <= ~clk;
end

// Set up the inputs to the design. Each line is a clock cycle.
initial begin
@(posedge clk);
reset <= 1; @(posedge clk); // Always reset FSMs at start
reset <= 0; @(posedge clk);
button <= 1; @(posedge clk);
@(posedge clk);
@(posedge clk);
button <= 0;@(posedge clk);
button <= 1;@(posedge clk);
button <= 0;@(posedge clk);
@(posedge clk);
$stop; // End the simulation.
end
endmodule 
