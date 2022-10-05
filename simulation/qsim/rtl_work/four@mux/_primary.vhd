library verilog;
use verilog.vl_types.all;
entity fourMux is
    port(
        uw0             : in     vl_logic_vector(7 downto 0);
        uw1             : in     vl_logic_vector(7 downto 0);
        uw2             : in     vl_logic_vector(7 downto 0);
        uw3             : in     vl_logic_vector(7 downto 0);
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        uy              : out    vl_logic_vector(7 downto 0)
    );
end fourMux;
