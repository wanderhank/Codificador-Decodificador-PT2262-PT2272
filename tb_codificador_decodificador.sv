module tb_codificador_decodificador;

  // Clock e sinal de reset
  logic clk;
  logic reset;

  // Entradas do DUT
  logic [7:0] A;
  logic [3:0] D_cod, D_dec, dv;

  // Outputs from the DUT
  logic sync;
  logic cod_o;

  // Instância do codificador
  codificador_pt2262 dut_codificador_pt2262 (
    .clk(clk),
    .reset(reset),
    .A(A),
    .D(D_cod),
    .sync(sync),
    .cod_o(cod_o)
  );

  //InstÂncia do decodificador
  decodificador_pt2272 dut_decodificador_pt2272 (
    .clk(clk),
    .reset(reset),
    .A(A),
    .cod_i(cod_o),
    .D(D_dec),
    .dv(dv)
  );


  //Geração do Clock
  initial begin
    clk = 0;
    forever #(333/2) clk = ~clk;  //O período do clock de 3 MHz é de 333ns, 166 ns para meio período 
  end

  initial begin
    // Reset 
    reset = 1;
    #334;
    reset = 0;

    // Teste 01: A e D em nível alto
    A = 8'b11111111;
    D_cod = 4'b1111;

    repeat (129000) @(posedge clk);

    // Teste 02: A e D em nível baixo
    A = 8'b00000000;
    D_cod = 4'b0000;


    repeat (129000) @(posedge clk);

    // Teste 03: A em nível F
    A = 8'bzzzzzzzz;
    D_cod = 4'b1010;

    repeat (129000) @(posedge clk);

    // Teste 04: Variação dos valores de A (1, 0 e F)
    A = 8'b10z01z10;
    D_cod = 4'b0001;

    repeat (129000) @(posedge clk);

    // Teste 05: Valor de A fora do padrão
    A = 8'b10z01z1x;
    D_cod = 4'b1001;

    repeat (129000) @(posedge clk);

    // Fim da simulação
    $finish;
  end

  // Monitoramento da saída da simulação
  initial begin
    $monitor($time, " clk=%b reset=%b A=%b D=%b sync=%b cod_o=%b", clk, reset, A, D_cod, sync, cod_o);
  end

endmodule
