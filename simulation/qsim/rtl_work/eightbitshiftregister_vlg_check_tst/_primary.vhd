library verilog;
use verilog.vl_types.all;
entity eightbitshiftregister_vlg_check_tst is
    port(
        o_Value         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end eightbitshiftregister_vlg_check_tst;
