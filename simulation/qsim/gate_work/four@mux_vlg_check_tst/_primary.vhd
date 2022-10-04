library verilog;
use verilog.vl_types.all;
entity fourMux_vlg_check_tst is
    port(
        uy              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end fourMux_vlg_check_tst;
