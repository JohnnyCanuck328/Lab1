library verilog;
use verilog.vl_types.all;
entity controlLogic_vlg_sample_tst is
    port(
        globalClk       : in     vl_logic;
        globalReset     : in     vl_logic;
        leftIn          : in     vl_logic;
        rightIn         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end controlLogic_vlg_sample_tst;
