library verilog;
use verilog.vl_types.all;
entity s_mult is
    generic(
        IN1WL           : integer := 8;
        IN2WL           : integer := 8;
        OUTWL           : vl_notype
    );
    port(
        IN1             : in     vl_logic_vector;
        IN2             : in     vl_logic_vector;
        \OUT\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IN1WL : constant is 1;
    attribute mti_svvh_generic_type of IN2WL : constant is 1;
    attribute mti_svvh_generic_type of OUTWL : constant is 3;
end s_mult;
