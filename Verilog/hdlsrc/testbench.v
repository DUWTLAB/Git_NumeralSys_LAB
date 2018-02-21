// use following command
// vsim -novopt +nowarnTSCALE work.testbench
`timescale 1ns/1ns
module testbench();

// clock setting
parameter CLK_PERIOD      = 10            ;
parameter CLK_PERIOD_2    = CLK_PERIOD*2  ;
parameter CLK_PERIOD_HALF = (CLK_PERIOD/2);


parameter TIME_RUN        = CLK_PERIOD* 1024 * 30;

wire  W_clk, W_rst;



initial begin
# TIME_RUN  $stop();
end


gen_clk_rst U_gen_clk_rst(
  .O_CLK(W_clk),
  .O_RST(W_rst));
defparam U_gen_clk_rst.CLK_PERIOD_HALF = CLK_PERIOD_HALF;

reg  signed [  8-1:0]   R_U_add_IN1;
reg  signed [  8-1:0]   R_U_add_IN2;
wire signed [1+8-1:0]   W_U_add_OUT;

s_add U_add(
  .IN1 (R_U_add_IN1),
  .IN2 (R_U_add_IN2),
  .OUT (W_U_add_OUT));
defparam U_add.INWL  = 8;


reg  signed [  8-1:0] R_U_mul_IN1;
reg  signed [  8-1:0] R_U_mul_IN2;
wire signed [8+8-1:0] W_U_mul_OUT;

s_mult U_mul(
  .IN1 (R_U_mul_IN1),
  .IN2 (R_U_mul_IN2),
  .OUT (W_U_mul_OUT));

defparam U_mul.IN1WL  = 8       ;
defparam U_mul.IN2WL  = 8       ;

always @ (posedge W_clk or posedge W_rst) begin
  if(W_rst) begin
    R_U_add_IN1 <= #1 0;
    R_U_add_IN2 <= #1 0;
    R_U_mul_IN1 <= #1 0;
    R_U_mul_IN2 <= #1 0;
  end 
  else begin
    R_U_add_IN1 <= #1 R_U_add_IN1 + 7;
    R_U_add_IN2 <= #1 R_U_add_IN2 + 1;
    
    R_U_mul_IN1 <= #1 R_U_mul_IN1 + 1;
    R_U_mul_IN2 <= #1 R_U_mul_IN2 + 7;
  end
end

parameter FWL_ADD_IN    = 7;                    // fraction word length
parameter SCALE_ADD_IN  = (1 << FWL_ADD_IN)  ;  // scale 
parameter FWL_ADD_OUT   = 7;  
parameter SCALE_ADD_OUT = (1 << FWL_ADD_OUT)  ;

parameter FWL_MUL_IN1    = 7;                    // fraction word length
parameter SCALE_MUL_IN1  = (1 << FWL_MUL_IN1)  ;  // scale 
parameter FWL_MUL_IN2    = 7;                    // fraction word length
parameter SCALE_MUL_IN2  = (1 << FWL_MUL_IN2)  ;  // scale 
parameter FWL_MUL_OUT    = FWL_MUL_IN1 + FWL_MUL_IN2;  
parameter SCALE_MUL_OUT  = (1 << FWL_MUL_OUT)  ;

real real_U_add_IN1_q, real_U_mul_IN1_q ;
real real_U_add_IN2_q, real_U_mul_IN2_q ;
real real_U_add_OUT_q, real_U_mul_OUT_q ;
real real_U_add_OUT_f, real_U_mul_OUT_f ;


always @ (*) begin
  real_U_add_IN1_q = 1.0 *  R_U_add_IN1/SCALE_ADD_IN    ;
  real_U_add_IN2_q = 1.0 *  R_U_add_IN2/SCALE_ADD_IN    ;
  real_U_add_OUT_q = 1.0 *  W_U_add_OUT/SCALE_ADD_OUT   ;
  real_U_add_OUT_f = real_U_add_IN1_q + real_U_add_IN2_q;

  real_U_mul_IN1_q = 1.0 *  R_U_mul_IN1/SCALE_MUL_IN1   ;
  real_U_mul_IN2_q = 1.0 *  R_U_mul_IN2/SCALE_MUL_IN2   ;
  real_U_mul_OUT_q = 1.0 *  W_U_mul_OUT/SCALE_MUL_OUT   ;
  real_U_mul_OUT_f = real_U_mul_IN1_q * real_U_mul_IN2_q;
end                 

endmodule   // testbench()


////////////////////////////////////////////////////////////////////////////////
module gen_clk_rst(
  O_CLK   ,
  O_RST   );

parameter CLK_PERIOD_HALF = 1; 

output O_CLK;
output O_RST;
reg O_CLK;
reg O_RST;
// inital the port value
initial begin
  O_CLK         = 0;
  O_RST         = 1;
  # 100 O_RST   = 1'b1;
  # 200 O_RST   = 1'b0;
end

always begin
  #CLK_PERIOD_HALF O_CLK = ~O_CLK;
end

endmodule
