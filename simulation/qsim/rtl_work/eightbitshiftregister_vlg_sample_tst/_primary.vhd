library verilog;
use verilog.vl_types.all;
entity eightbitshiftregister_vlg_sample_tst is
    port(
        controller      : in     vl_logic;
        i_clock         : in     vl_logic;
        i_load          : in     vl_logic;
        i_resetBar      : in     vl_logic;
        i_Value         : in     vl_logic_vector(7 downto 0);
        shiftIn         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end eightbitshiftregister_vlg_sample_tst;
