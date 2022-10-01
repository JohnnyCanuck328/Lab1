library ieee;
use ieee.std_logic_1164.all;

entity h4InMux is
	port(uw0, uw1, uw2, uw3: in std_logic;
	s0, s1: in std_logic;
	uy: out std_logic);
end h4InMux;

architecture struct4InMux of h4InMux is
	component h2InMux
		port (w0, w1, en: in std_logic;
				y: out std_logic);
	end component;
	
	signal mux0Out: std_logic;
	signal mux1Out: std_logic;
	
	begin
	--port map (inputs(component_input1 => upper_entityInput1, ... ,component_inputN => upper_entityInputN)
	--				outputs(component_output => upper_EntityOutput));
		twoIN0: h2InMux port map(en => s0, w0 => uw0, w1 => uw1, y => mux0Out);
		
		twoIN1: h2InMux port map(en => s0, w0 => uw2, w1 => uw3, y => mux1Out);
		
		twoIN2: h2InMux port map(en => s1, w0 => mux0Out, w1 => mux1Out, y => uy);
	
end struct4InMux;
	
	