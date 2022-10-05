library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        leftIn          : in     vl_logic;
        rightIn         : in     vl_logic;
        g_clk           : in     vl_logic;
        globalRes       : in     vl_logic;
        pLoadD          : in     vl_logic;
        pLoadL          : in     vl_logic;
        pLoadR          : in     vl_logic;
        led             : out    vl_logic_vector(7 downto 0)
    );
end datapath;
