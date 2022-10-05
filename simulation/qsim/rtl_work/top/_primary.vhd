library verilog;
use verilog.vl_types.all;
entity top is
    port(
        LED7            : out    vl_logic;
        leftIn          : in     vl_logic;
        rightIn         : in     vl_logic;
        globalClock     : in     vl_logic;
        globalReset     : in     vl_logic;
        LED6            : out    vl_logic;
        LED5            : out    vl_logic;
        LED4            : out    vl_logic;
        LED3            : out    vl_logic;
        LED2            : out    vl_logic;
        LED1            : out    vl_logic;
        LED0            : out    vl_logic
    );
end top;
