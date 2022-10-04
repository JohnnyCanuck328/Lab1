library ieee;
use ieee.std_logic_1164.all;

entity h2InMux_tb is
end h2InMux_tb;

architecture twoInTest of h2InMux_tb is

	component h2InMux
		port(w0: in std_logic_vector(7 downto 0);
		w1: in std_logic_vector(7 downto 0);
		en: in std_logic;
		y: out std_logic_vector(7 downto 0));
	end component;
	
	signal lsb: std_logic_vector(7 downto 0);
	signal msb: std_logic_vector(7 downto 0);
	signal gEn: std_logic:='0';
	signal output: std_logic_vector(7 downto 0);
	
	begin
	
	DUT: h2InMux port map(w0 => lsb, w1 => msb, en => gEn, y => output);
	stim: process
	begin
	
	wait for 5ns;
	lsb <= "10000000";
	msb <= "00000000";
	
	wait for 5ns;
	
	lsb <= "10000000";
	
	wait for 5ns;
	
	gEn <= '1';
	
	wait for 5ns;
	
	msb <= "00001000";
	
	wait for 5ns;
	wait;
	
	end process;

end twoInTest;