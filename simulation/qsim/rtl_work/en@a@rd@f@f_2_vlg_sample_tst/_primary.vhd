library verilog;
use verilog.vl_types.all;
entity enARdFF_2_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_d             : in     vl_logic;
        i_enable        : in     vl_logic;
        i_resetBar      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end enARdFF_2_vlg_sample_tst;
