module bird_position (clk, reset, playerin, position);

input logic clk, reset, playerin;

output logic [15:0][15:0] position;

enum{A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P} ps, ns;

always_ff @(posedge clk, posedge reset) begin
if (reset) 
	ps <= H;
else
	ps <= ns;
end

always_comb begin
	case(ps)
		A: if (playerin) ns = A;
			else ns = B;
		B: if (playerin) ns = A;
			else ns = C;
		C: if (playerin) ns = B;
			else ns = D;
		D: if (playerin) ns = C;
			else ns = E;
		E: if (playerin) ns = D;
			else ns = F;
		F: if (playerin) ns = E;
			else ns = G;
		G: if (playerin) ns = F;
			else ns = H;
		H: if (playerin) ns = G;
			else ns = I;
		I: if (playerin) ns = H;
			else ns = J;
		J: if (playerin) ns = I;
			else ns = K;
		K: if (playerin) ns = J;
			else ns = L;
		L: if (playerin) ns = K;
			else ns = M;
		M: if (playerin) ns = L;
			else ns = N;
		N: if (playerin) ns = M;
			else ns = O;
		O: if (playerin) ns = N;
			else ns = P;
		P: if (playerin) ns = O;
			else ns = P;
	endcase
end
	
always_comb begin
	case(ps)					
		A: begin position[00] = 16'b0000100000000000;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end

		B: begin position[00] = 16'b0;
			position[01] = 16'b0000100000000000;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		C: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0000100000000000;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		D: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0000100000000000;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		E: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0000100000000000;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		F: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0000100000000000;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		G: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0000100000000000;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		H: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0000100000000000;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		I: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0000100000000000;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		J: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0000100000000000;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		K: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0000100000000000;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		
		L: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0000100000000000;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
		
		M: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0000100000000000;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end 
			
		N: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0000100000000000;
		   position[14] = 16'b0;
		   position[15] = 16'b0;
			end
			
		O: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0000100000000000;
		   position[15] = 16'b0;
			end 
			
		P: begin position[00] = 16'b0;
			position[01] = 16'b0;
		   position[02] = 16'b0;
		   position[03] = 16'b0;
		   position[04] = 16'b0;
		   position[05] = 16'b0;
		   position[06] = 16'b0;
		   position[07] = 16'b0;
		   position[08] = 16'b0;
		   position[09] = 16'b0;
		   position[10] = 16'b0;
		   position[11] = 16'b0;
		   position[12] = 16'b0;
		   position[13] = 16'b0;
		   position[14] = 16'b0;
		   position[15] = 16'b0000100000000000;
			end
	endcase
end 

endmodule
