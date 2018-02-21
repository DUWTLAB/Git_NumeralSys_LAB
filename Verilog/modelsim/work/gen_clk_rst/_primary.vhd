library verilog;
use verilog.vl_types.all;
entity gen_clk_rst is
    generic(
        CLK_PERIOD_HALF : integer := 1
    );
    port(
        O_CLK           : out    vl_logic;
        O_RST           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD_HALF : constant is 1;
end gen_clk_rst;
