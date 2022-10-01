library verilog;
use verilog.vl_types.all;
entity enARdFF_2 is
    port(
        i_resetBar      : in     vl_logic;
        i_d             : in     vl_logic;
        i_enable        : in     vl_logic;
        i_clock         : in     vl_logic;
        o_q             : out    vl_logic;
        o_qBar          : out    vl_logic
    );
end enARdFF_2;
