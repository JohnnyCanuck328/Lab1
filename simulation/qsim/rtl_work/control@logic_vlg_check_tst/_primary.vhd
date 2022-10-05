library verilog;
use verilog.vl_types.all;
entity controlLogic_vlg_check_tst is
    port(
        pLoadD          : in     vl_logic;
        S               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end controlLogic_vlg_check_tst;
