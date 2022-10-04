library verilog;
use verilog.vl_types.all;
entity eightBitRightShift is
    port(
        controller      : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        shiftIn         : in     vl_logic;
        enable          : in     vl_logic;
        inp             : in     vl_logic_vector(7 downto 0);
        output          : out    vl_logic_vector(7 downto 0);
        NOToutput       : out    vl_logic_vector(7 downto 0)
    );
end eightBitRightShift;
