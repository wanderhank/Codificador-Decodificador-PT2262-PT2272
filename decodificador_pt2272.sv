module decodificador_pt2272(
	input clk, // 3MHz conforme especificação
	input reset, // reset ativo alto
	input [7:0] A, // endereço de entrada, trinário
	input cod_i,  // dado codificado de entrada
	output logic [3:0] D, // dado recebido registrado
	output logic dv       // sinalização de novo dado valido recebido, sincrono ao mesmo dominio de clock da saída "D"
);	

	logic [7:0] A_01, A_F, A_01_s, A_F_s, A_01_ff, A_F_ff, A_01_new;
	clock_12k inst_freq_div (.clk(clk), .reset(reset), .osc_12(osc_12));
	comp_endereco inst_comp_endereco (.A(A), .A_01(A_01), .A_F(A_F));
	logic [3:0] D_s;
	logic dv_s;

	localparam logic [0:31] Bit_0 = 32'b1111_0000_0000_0000_1111_0000_0000_0000;
	localparam logic [0:31] Bit_1 = 32'b1111_1111_1111_0000_1111_1111_1111_0000;
	localparam logic [0:31] Bit_F = 32'b1111_0000_0000_0000_1111_1111_1111_0000;
	localparam logic [0:31] Bit_SYNC1 = 32'b1111_0000_0000_0000_0000_0000_0000_0000;
	typedef enum logic [3:0] {DEC_A, DEC_D, DEC_SYNC} state;


	state current_state, next_state;

	logic [31:0] regSign; //registrador que guarda a entrada cod_i
	logic [4:0] regSignCount_s, regSignCount_ff; // contador que registra o número de bits escritos em regSign
	logic [3:0] counterA_s, counterA_ff;
	logic [2:0] counterD_s, counterD_ff;
	logic [2:0] counterSync_s, counterSync_ff;
	logic [3:0] registerD_s, registerD_ff;


  	always_ff @(posedge osc_12 or posedge reset) begin
  		if(reset) begin
  			 counterA_ff <= 1'b0;
  			 regSignCount_ff <= 0;
  			 counterSync_ff <= 0;
  			 counterD_ff <= 3;
  			 D <= 0;
  			 regSign <= 31'b0;
  			 dv <= 0;
			 registerD_ff <= 3'b0;
			 current_state <= DEC_A;
  		end else begin
  			 regSignCount_ff <= regSignCount_s;
  			 counterA_ff <= counterA_s;
  			 counterD_ff <= counterD_s;
  			 counterSync_ff <= counterSync_s;
  			 A_F_ff <= A_F_s;
  			 A_01_ff <= A_01_s;
			 registerD_ff <= registerD_s;
  			 if (dv_s) begin
  			 	D <= D_s;
  			 end
  			 dv <= dv_s;
  			 regSign <= {regSign[30:0], cod_i};
			 current_state <= next_state;
  		end
  	end

  	always_comb begin 
  		if(reset) begin
  			next_state = DEC_A;
  			counterA_s = 0;
  			counterD_s = 3;
  			counterSync_s = 0;
  			regSignCount_s = 0;
  			D_s = 0;
  			dv_s = 0;
			A_F_s = 0;
			registerD_s = 0;
			A_01_s = 0;
  		end else begin
  			next_state = current_state;
  			counterA_s = counterA_ff;
  			counterD_s = counterD_ff;
  			counterSync_s = counterSync_ff;
  			regSignCount_s = regSignCount_ff;
			registerD_s = registerD_ff;
  			A_01_s = A_01_ff;
  			A_F_s = A_F_ff;
  			D_s = D;
  			dv_s = 0;

  			case (current_state)
  				DEC_A: begin
  					counterA_s  = counterA_ff;  			
                	if (counterA_ff == 0) begin
                		if (regSign == Bit_0 || regSign == Bit_1 || regSign == Bit_F) begin
	                        counterA_s = counterA_ff + 1;
	                        A_F_s[counterA_ff] = (regSign == Bit_F) ? 1'b1 : 1'b0;
	                        A_01_s[counterA_ff] = (regSign == Bit_1) ? 1'b1 : 1'b0;
	                    end else begin
	                    	next_state = DEC_A;
	                    	counterA_s = 0;	                    	
	                    end
                	end else if (counterA_ff <= 7) begin
                		regSignCount_s = regSignCount_ff + 1;
                		if (regSignCount_ff == 31) begin          
		                    if (regSign == Bit_0 || regSign == Bit_1 || regSign == Bit_F) begin
		                        counterA_s = counterA_ff + 1;
		                        A_F_s[counterA_ff] = (regSign == Bit_F) ? 1'b1 : 1'b0;
	                        	A_01_s[counterA_ff] = (regSign == Bit_1) ? 1'b1 : 1'b0;
	                        	if (counterA_ff == 7) begin
					            	next_state = DEC_D;
					            	counterA_s = 0;
			                	end
		                    end else begin
	                    	next_state = DEC_A;
	                    	counterA_s = 0;
	                    end
		                end
		            end
		        end 
  				DEC_D: begin
  					regSignCount_s = regSignCount_ff + 1;
  					counterD_s  = counterD_ff;
  					
  					if (regSignCount_ff == 31) begin
  						counterD_s = counterD_ff - 1;
  						if (regSign == Bit_0 || regSign == Bit_1) begin
  							registerD_s[counterD_ff] = (regSign == Bit_1) ? 1'b1 : 1'b0;
  						end else begin
  							next_state = DEC_A;
  							counterD_s = 3;
  						end  						
  					end	

  					if (counterD_ff == 0 && regSignCount_ff == 31) begin
			            next_state = DEC_SYNC;
			            counterD_s = 3;
			         end
			    end
			    DEC_SYNC: begin
			    	regSignCount_s = regSignCount_ff + 1;
			    	if (counterSync_ff == 0 && regSignCount_ff == 31) begin
			    		if (regSign == Bit_SYNC1) begin
			    			counterSync_s = counterSync_ff + 1;
			    		end else begin
	                    	next_state = DEC_A;
	                    	counterSync_s = 0;	                    	
	                    end
			    	end else if (counterSync_ff <= 3 && regSignCount_ff == 31) begin
			    		if (regSign == 0) begin
			    			counterSync_s = counterSync_ff + 1;
			    		end 
			    	end 
			    	if (counterSync_ff == 3 && regSignCount_ff == 31) begin
			    		counterSync_s = 0;
			    		for (int i = 0; i < 8; i++) begin
			    		if (A_F[i] == 1'b1) begin
			    			A_01_new[i] = 0;
			    		end else if (A_01[i] == 1) begin
			    			A_01_new[i] = 1;
			    		end else
			    			A_01_new[i] = 0;
			    	end

			    	if (A_01_new == A_01_ff && A_F_ff == A_F) begin
			    		D_s = registerD_s;
			    		dv_s = 1;
			    	end
			    	next_state = DEC_A;
			    	end
			    end
  			endcase
  		end
  	end
endmodule
