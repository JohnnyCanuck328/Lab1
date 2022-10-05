library verilog;
use verilog.vl_types.all;
entity datapath_vlg_sample_tst is
    port(
        g_clk           : in     vl_logic;
        globalRes       : in     vl_logic;
        leftIn          : in     vl_logic;
        pLoadD          : in     vl_logic;
        pLoadL          : in     vl_logic;
        pLoadR          : in     vl_logic;
        rightIn         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end datapath_vlg_sample_tst;
