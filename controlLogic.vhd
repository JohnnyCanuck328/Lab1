library ieee;
use ieee.std_logic_1164.all;

entity controlLogic is
	port(leftIn, rightIn: in std_logic;
			globalClk: in std_logic;
			globalReset: in std_logic;
			pLoadD: out std_logic;
			S: out std_logic_vector(4 downto 0));
end controlLogic;

architecture structControl of controlLogic is

	component dFF_2
	PORT(i_setBar   : IN STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q 	: OUT	STD_LOGIC);
	end component;
	
	signal set, state: std_logic;
	signal sIn: std_logic_vector(4 downto 0);
	signal output: std_logic_vector(4 downto 0);
	signal gnd, vcc: std_logic;
	signal NOTright, NOTleft: std_logic;
	
	
	begin	
	
	state <= output(0) or output(1) or output(2) or output(3) or output(4);
	set <= NOT(globalReset);
	NOTleft <= NOT(leftIn);
	NOTright <= NOT(rightIn);
	sIn(0) <= '1';
	sIn(1) <= state AND leftIn AND rightIn;
	sIn(2) <= state AND NOTleft AND rightIn;
	sIn(3) <= state AND leftIn AND NOTright;
	sIn(4) <= state AND NOTleft AND NOTright;
	
	--might need to be changed to vcc
	state0: dFF_2 port map(i_setBar => set, i_d => sIn(0), i_clock => globalClk, o_q => output(0));
	
	state1: dFF_2 port map(i_setBar => globalReset, i_d => sIn(1), i_clock => globalClk, o_q => output(1));
	
	state2: dFF_2 port map(i_setBar => globalReset, i_d => sIn(2), i_clock => globalClk, o_q => output(2));
	
	state3: dFF_2 port map(i_setBar => globalReset, i_d => sIn(3), i_clock => globalClk, o_q => output(3));
	
	state4: dFF_2 port map(i_setBar => globalReset, i_d => sIn(4), i_clock => globalClk, o_q => output(4));
	
	pLoadD <= output(0) OR output(4);
	S(0) <= output(0);
	S(1) <= output(1);
	S(2) <= output(2);
	S(3) <= output(3);
	S(4) <= output(4);

end structControl;