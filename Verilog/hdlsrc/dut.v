module s_add(
  IN1 ,
  IN2 ,
  OUT );

parameter INWL  = 8       ;
parameter OUTWL = INWL + 1;

input  signed [INWL -1:0] IN1, IN2;
output signed [OUTWL-1:0] OUT;

reg   signed [OUTWL-1:0] W_add;

always @ (IN1 or IN2) begin
  W_add = IN1 + IN2;
end

assign OUT = W_add;

endmodule

module s_mult(
  IN1 ,
  IN2 ,
  OUT );

parameter IN1WL  = 8       ;
parameter IN2WL  = 8       ;
parameter OUTWL  = IN1WL + IN2WL;


input signed [IN1WL -1:0] IN1;
input signed [IN2WL -1:0] IN2;
output signed [OUTWL-1:0] OUT;

reg   signed [OUTWL-1:0]  W_p;

always @ (IN1 or IN2) begin
  W_p = IN1 * IN2;
end

assign OUT = W_p;

endmodule
