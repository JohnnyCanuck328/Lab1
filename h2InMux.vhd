library IEEE;
use ieee.std_logic_1164.all;

entity h2InMux is
	port(w0,w1: in std_logic;
	en: in std_logic;
	y: out std_logic);
end h2InMux;

architecture behav2InMux of h2InMux is 
begin process(w0, w1, en)

	begin
	
	if en = '1' then 
		y <= w1;
	else
		y <= w0;
		
	end if;
	
end process;
end behav2InMux;