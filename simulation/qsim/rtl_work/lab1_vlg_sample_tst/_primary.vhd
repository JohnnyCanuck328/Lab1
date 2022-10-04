library verilog;
use verilog.vl_types.all;
entity lab1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        controller      : in     vl_logic;
        enable          : in     vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        in3             : in     vl_logic;
        in4             : in     vl_logic;
        in5             : in     vl_logic;
        in6             : in     vl_logic;
        in7             : in     vl_logic;
        reset           : in     vl_logic;
        shiftIn         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab1_vlg_sample_tst;
