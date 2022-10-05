library verilog;
use verilog.vl_types.all;
entity top_vlg_check_tst is
    port(
        LED0            : in     vl_logic;
        LED1            : in     vl_logic;
        LED2            : in     vl_logic;
        LED3            : in     vl_logic;
        LED4            : in     vl_logic;
        LED5            : in     vl_logic;
        LED6            : in     vl_logic;
        LED7            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end top_vlg_check_tst;
