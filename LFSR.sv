module LFSR (Clock, reset, out);
input logic Clock, reset;
output logic [3:0] out;
 

always_ff @ (posedge Clock, posedge reset) begin

if (reset) out <= 4'b0;
else out <= {out[0] ~^ out [1], out[3:1]};

end


endmodule

module LFSR_testbench();

logic clk, reset;
logic [9:0] out;
LFSR dut (clk, reset, out);

parameter CLOCK_PERIOD=100;
initial begin
clk <= 0;
forever #(CLOCK_PERIOD/2) clk <= ~clk;
end

// Set up the inputs to the design. Each line is a clock cycle.
initial begin
reset <= 1; @(posedge clk); // Always reset FSMs at start
reset <= 0; @(posedge clk);
@(posedge clk);
@(posedge clk);
reset <= 1; @(posedge clk);
reset <= 0; @(posedge clk);
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
reset <= 1; @(posedge clk);
reset <= 0; @(posedge clk);
@(posedge clk);

$stop; // End the simulation.
end
endmodule 