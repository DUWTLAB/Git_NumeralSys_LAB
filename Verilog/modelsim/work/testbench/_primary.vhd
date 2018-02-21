library verilog;
use verilog.vl_types.all;
entity testbench is
    generic(
        CLK_PERIOD      : integer := 10;
        CLK_PERIOD_2    : vl_notype;
        CLK_PERIOD_HALF : vl_notype;
        TIME_RUN        : vl_notype;
        FWL_ADD_IN      : integer := 7;
        SCALE_ADD_IN    : vl_notype;
        FWL_ADD_OUT     : integer := 7;
        SCALE_ADD_OUT   : vl_notype;
        FWL_MUL_IN1     : integer := 7;
        SCALE_MUL_IN1   : vl_notype;
        FWL_MUL_IN2     : integer := 7;
        SCALE_MUL_IN2   : vl_notype;
        FWL_MUL_OUT     : vl_notype;
        SCALE_MUL_OUT   : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of CLK_PERIOD_2 : constant is 3;
    attribute mti_svvh_generic_type of CLK_PERIOD_HALF : constant is 3;
    attribute mti_svvh_generic_type of TIME_RUN : constant is 3;
    attribute mti_svvh_generic_type of FWL_ADD_IN : constant is 1;
    attribute mti_svvh_generic_type of SCALE_ADD_IN : constant is 3;
    attribute mti_svvh_generic_type of FWL_ADD_OUT : constant is 1;
    attribute mti_svvh_generic_type of SCALE_ADD_OUT : constant is 3;
    attribute mti_svvh_generic_type of FWL_MUL_IN1 : constant is 1;
    attribute mti_svvh_generic_type of SCALE_MUL_IN1 : constant is 3;
    attribute mti_svvh_generic_type of FWL_MUL_IN2 : constant is 1;
    attribute mti_svvh_generic_type of SCALE_MUL_IN2 : constant is 3;
    attribute mti_svvh_generic_type of FWL_MUL_OUT : constant is 3;
    attribute mti_svvh_generic_type of SCALE_MUL_OUT : constant is 3;
end testbench;
