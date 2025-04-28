module codificador_pt2262 (
	input clk, // 3MHz conforme especificação
	input reset, // reset ativo alto
	input [7:0] A, // endereço de entrada, trinário
	input [3:0] D, // dado de entrada
	output logic sync, // indica geracao do simbolo sync
	output logic cod_o  // saida codificada
	);
  
  logic [7:0] A_01, A_F;

	comp_endereco inst_comp_endereco (.A(A), .A_01(A_01), .A_F(A_F));
  clock_12k inst_freq_div (.clk(clk), .reset(reset), .osc_12(osc_12));
	
	
	localparam logic [0:31] Bit_0 = 32'b1111_0000_0000_0000_1111_0000_0000_0000;
	localparam logic [0:31] Bit_1 = 32'b1111_1111_1111_0000_1111_1111_1111_0000;
	localparam logic [0:31] Bit_F = 32'b1111_0000_0000_0000_1111_1111_1111_0000;
  localparam logic [0:127] Sync = {4'b1111,{124{1'b0}}};

	typedef enum logic [2:0] {COD_A, COD_D, SEND_SYNC} state;
	state current_state, next_state;
  logic [1:0] counterD_s, counterD_ff;
  logic [2:0] counterA_s, counterA_ff;
  logic [4:0] bit_counter_s, bit_counter_ff;
  logic [6:0] sync_counter_s, sync_counter_ff;
  logic [0:3] regD;

  always_ff @(posedge osc_12 or posedge reset) begin
    if (reset) begin
      sync_counter_ff <= 1'b0;
      counterA_ff <= 1'b0;
      counterD_ff <= 1'b0;
      bit_counter_ff <= 1'b0;
      current_state <= COD_A;

    end else begin
      sync_counter_ff <= sync_counter_s;
      counterA_ff <= counterA_s;
      counterD_ff <= counterD_s;
      bit_counter_ff <= bit_counter_s;
      current_state <= next_state;
    end
  end

  always_comb begin
    if (reset) begin
      next_state = COD_A;
      regD = 4'b0;
      counterA_s = 3'b0;
      counterD_s = 2'b0;
      bit_counter_s = 5'b0;
      sync_counter_s = 7'b0;
      sync = 1'b0;
      cod_o = 1'b0;

    end else begin
      sync = 1'b0;
      counterA_s = 1'b0;
      counterD_s = 3;
      next_state = current_state;
      bit_counter_s = 1'b0;
      sync_counter_s= 1'b0;
      regD = D;
      cod_o = 1'b0;

      case (current_state)
        COD_A: begin
          bit_counter_s = bit_counter_ff + 1;
          counterA_s  = counterA_ff;

          if (bit_counter_ff == 31) begin
            counterA_s = counterA_ff + 1;
          end

          cod_o = (A_F[counterA_ff] == 1'b1) ? Bit_F[bit_counter_ff] :
                  (A_01[counterA_ff] == 1'b1) ? Bit_1[bit_counter_ff] : Bit_0[bit_counter_ff];
        
          if (counterA_ff == 7 && bit_counter_ff == 31) begin
            next_state = COD_D;
          end
        end
        COD_D: begin
          bit_counter_s = bit_counter_ff + 1;
          counterD_s  = counterD_ff;

          if (bit_counter_ff == 31) begin
            counterD_s = counterD_ff - 1;
          end

          cod_o = (regD[counterD_ff] == 1'b1) ? Bit_1[bit_counter_ff] : Bit_0[bit_counter_ff];

          if (counterD_ff == 0 && bit_counter_ff == 31) begin
            next_state = SEND_SYNC;
          end
        end
        SEND_SYNC: begin
          sync = 1'b1;
          sync_counter_s = sync_counter_ff + 1;
          cod_o = Sync[sync_counter_ff];
          if (sync_counter_ff == 127) begin
            sync_counter_s = 0;
            next_state = COD_A;
          end
        end
      endcase
    end
  end
endmodule
