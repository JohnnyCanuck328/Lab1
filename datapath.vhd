library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------
--check whether reset is active low or high
------------------------------------------------------
entity datapath is
	port(leftIn, rightIn: in std_logic;
			g_clk: in std_logic;
			globalRes: in std_logic;
			--LFRT == mode
			LFRT: in std_logic_vector(1 downto 0);
			led: out std_logic_vector(7 downto 0));
end datapath;

architecture structData of datapath is

	component eightBitUniversalReg
		PORT(
			i_resetBar, i_load	: IN	STD_LOGIC;
			shiftDir, mode: in std_logic;
			rightShiftIn, leftShiftIn: in std_logic;
			i_clock			: IN	STD_LOGIC;
			i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
			o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
	END component;
	
	component h2InMux
		port(w0,w1: in std_logic_vector(7 downto 0);
		en: in std_logic;
		y: out std_logic_vector(7 downto 0));
	end component;
	
	component h4InMux
		port(uw0, uw1, uw2, uw3: in std_logic_vector(7 downto 0);
		s0, s1: in std_logic;
		uy: out std_logic_vector(7 downto 0));
	end component;
	
	--signals go here
	signal leftOrRight: std_logic_vector(7 downto 0);
	signal mux4Out: std_logic_vector(7 downto 0);
	signal mux2Out: std_logic_vector(7 downto 0);
	signal RMASKout: std_logic_vector(7 downto 0);
	signal LMASKout: std_logic_vector(7 downto 0);
	signal pLoadL: std_logic_vector(7 downto 0);
	signal pLoadR: std_logic_vector(7 downto 0);
	signal pLoadD: std_logic;
	
	signal vcc: std_logic := '1';
	signal ground: std_logic := '0';
	
	--signals end here
	
	--begins here
	begin
	
	leftOrRight <= RMASKout OR LMASKout;
	
	LMASK: eightBitUniversalReg port map(i_resetBar => globalRes, i_load => leftIn, shiftDir=> vcc, mode => LFRT(0)
													, rightShiftIn => vcc, leftShiftIn => vcc, i_clock => g_clk, i_Value => pLoadL, o_Value => LMASKout);
	
	RMASK: eightBitUniversalReg port map(i_resetBar => globalRes, i_load => rightIn, shiftDir => ground, mode => LFRT(1)
													, rightShiftIn => vcc, leftShiftIn => vcc, i_clock => g_clk, i_Value => pLoadR, o_Value => RMASKout);
													
	Display: eightBitUniversalReg port map(i_resetBar => globalRes, i_load => '1', shiftDir => ground, mode => ground
													, rightShiftIn => ground, leftShiftIn => ground, i_clock => g_clk, i_Value => mux2Out, o_Value => led);
	
	mux2: h2InMux port map(w0 => mux4Out, w1 => "00000000", en => pLoadD, y => mux2Out);
	
	mux4: h4InMux port map(uw0 => "00000000", uw1 => LMASKout, uw2 => RMASKout, uw3 => leftOrRight, s0 => leftIn, s1 => rightIn, uy => mux4Out);
	
	
end structData;

