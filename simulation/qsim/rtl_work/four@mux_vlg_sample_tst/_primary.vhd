library verilog;
use verilog.vl_types.all;
entity fourMux_vlg_sample_tst is
    port(
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        uw0             : in     vl_logic_vector(7 downto 0);
        uw1             : in     vl_logic_vector(7 downto 0);
        uw2             : in     vl_logic_vector(7 downto 0);
        uw3             : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end fourMux_vlg_sample_tst;
