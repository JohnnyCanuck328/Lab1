library verilog;
use verilog.vl_types.all;
entity dFF_2 is
    port(
        i_setBar        : in     vl_logic;
        i_d             : in     vl_logic;
        i_clock         : in     vl_logic;
        o_q             : out    vl_logic
    );
end dFF_2;
