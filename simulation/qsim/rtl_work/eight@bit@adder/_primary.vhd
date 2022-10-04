library verilog;
use verilog.vl_types.all;
entity eightBitAdder is
    port(
        i_Ai            : in     vl_logic_vector(7 downto 0);
        i_Bi            : in     vl_logic_vector(7 downto 0);
        o_CarryOut      : out    vl_logic;
        o_Sum           : out    vl_logic_vector(7 downto 0)
    );
end eightBitAdder;
