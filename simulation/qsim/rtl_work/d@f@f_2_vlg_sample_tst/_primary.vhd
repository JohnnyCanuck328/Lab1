library verilog;
use verilog.vl_types.all;
entity dFF_2_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_d             : in     vl_logic;
        i_setBar        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dFF_2_vlg_sample_tst;
