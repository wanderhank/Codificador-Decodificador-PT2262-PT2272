module clock_12k (
	input logic clk,
	input logic reset,
	output logic osc_12
	);
	logic [6:0] counter;

	always_ff @(posedge clk) begin
    if (reset) begin
      osc_12 <= 1'b1;
      counter <= 1'b0;
    end else begin
      if (counter == 8'd124) begin
        counter <= 1'b0;
        osc_12 <= ~osc_12;
      end else begin
        counter <= counter + 1'b1;
      end
    end
  end

endmodule
