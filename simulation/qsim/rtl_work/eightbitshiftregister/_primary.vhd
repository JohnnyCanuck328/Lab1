library verilog;
use verilog.vl_types.all;
entity eightbitshiftregister is
    port(
        i_resetBar      : in     vl_logic;
        i_load          : in     vl_logic;
        controller      : in     vl_logic;
        shiftIn         : in     vl_logic;
        i_clock         : in     vl_logic;
        i_Value         : in     vl_logic_vector(7 downto 0);
        o_Value         : out    vl_logic_vector(7 downto 0)
    );
end eightbitshiftregister;
