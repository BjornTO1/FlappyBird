module game_over(bird, pipe, gameover, win);
input logic [15:0][15:0] bird, pipe;
output logic gameover, win;

// Internal variables
    logic match;

    // Logic to compare arrays
    always_comb begin
        match = 0;
        for (int i = 0; i < 16; i++) begin
            for (int j = 0; j < 16; j++) begin
                if (bird[i][j] && pipe[i][j]) begin
                    match = 1;
                    break;
                end
            end
            if (match) // Break if match is found
                break;
        end
    end
	 
	 always_comb begin 
	 if (pipe[00] == 16'b0001000000000000 && !match) win = 1'b1;
	 else win = 1'b0;
	 end
    // Assign output
    assign gameover = match;
	 

endmodule

