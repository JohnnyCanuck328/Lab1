library ieee;
use ieee.std_logic_1164.ALL;

entity controlpath is 
    PORT(right_in,left_in: IN STD_LOGIC;
	    i_clk,i_reset : IN STD_LOGIC;
	    o_loadD, o_loadl, o_loadr: OUT STD_LOGIC);
end controlpath;



architecture rtl of controlpath is 



component dFF_2 IS
			PORT(
					i_setBar   : IN STD_LOGIC;
					i_d        : IN STD_LOGIC;
					i_enable   : IN STD_LOGIC;
					i_clock    : IN STD_LOGIC;
					o_q   : OUT STD_LOGIC);
end component;

signal s0,s1,s2,s3,s4 : STD_LOGIC;


begin

d0:dFF_2 PORT MAP(
               i_setBar => i_reset,
               i_d        => '0',
               i_enable   => '1',
               i_clock    => i_clk,
               o_q        => s0);

d1:dFF_2 PORT MAP(
              i_setBar => i_reset,
              i_d        => right_in AND left_in AND (s0 or s1 or s2 or s3 or s4),
              i_enable   => '1',
              i_clock    => i_clk,
              o_q        => s1);

d2:dFF_2 PORT MAP(
              i_setBar => i_reset,
              i_d        => not left_in AND right_in AND (s0 or s1 or s2 or s3 or s4),
              i_enable   => '1',
              i_clock    => i_clk,
              o_q        => s2);

d3:dFF_2 PORT MAP(
              i_setBar => i_reset,
              i_d        => not right_in AND left_in AND (s0 or s1 or s2 or s3 or s4),
              i_enable   => '1',
              i_clock    => i_clk,
              o_q        => s3);

d4:dFF_2 PORT MAP(
             i_setBar => i_reset,
             i_d        => (not (right_in) AND not(left_in)) and (s0 or s1 or s2 or s3 or s4) ,
             i_enable   => '1',
             i_clock    => i_clk,
             o_q        => s4);

o_loadD <= s0 or o_loadl or o_loadr or s4;


end rtl;
