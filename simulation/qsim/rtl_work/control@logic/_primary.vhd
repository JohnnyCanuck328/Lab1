library verilog;
use verilog.vl_types.all;
entity controlLogic is
    port(
        leftIn          : in     vl_logic;
        rightIn         : in     vl_logic;
        globalClk       : in     vl_logic;
        globalReset     : in     vl_logic;
        pLoadD          : out    vl_logic;
        S               : out    vl_logic_vector(4 downto 0)
    );
end controlLogic;
