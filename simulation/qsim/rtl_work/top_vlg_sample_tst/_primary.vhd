library verilog;
use verilog.vl_types.all;
entity top_vlg_sample_tst is
    port(
        globalClock     : in     vl_logic;
        globalReset     : in     vl_logic;
        leftIn          : in     vl_logic;
        rightIn         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_vlg_sample_tst;
