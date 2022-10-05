library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------
--keep reset 1, turning reset to 0 will wipe regs
--controller 1 means load, 0 means shift
------------------------------------------------------
entity datapath is
	port(leftIn, rightIn: in std_logic;
			g_clk: in std_logic;
			globalRes: in std_logic;
			pLoadD, pLoadL, pLoadR: in std_logic;
			led: out std_logic_vector(7 downto 0));
end datapath;

architecture structData of datapath is

	component eightBitRightShift
		PORT (controller :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		shiftIn :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		inp :  IN  STD_LOGIC_VECTOR(7 downto 0);
		output0, output1, output2, output3, output4, output5, output6, output7 :  OUT  STD_LOGIC;
		NOToutput:  OUT  STD_LOGIC_VECTOR(7 downto 0));
	END component;
	
	component eightBitLeftShift
		PORT (controller :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		shiftIn :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		inp :  IN  STD_LOGIC_VECTOR(7 downto 0);
		output0, output1, output2, output3, output4, output5, output6, output7 :  OUT  STD_LOGIC;
		NOToutput:  OUT  STD_LOGIC_VECTOR(7 downto 0));
	END component;
	
	component h2InMux
		port(w0,w1: in std_logic_vector(7 downto 0);
		en: in std_logic;
		y: out std_logic_vector(7 downto 0));
	end component;
	
	component fourMux
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
	signal displayCont: std_logic;
	
	signal vcc: std_logic := '1';
	signal ground: std_logic := '0';
	
	--signals end here
	
	--begins here
	begin
	
	leftOrRight <= RMASKout OR LMASKout;
	displayCont <= leftIn or rightIn or pLoadD;
	
	LMASK: eightBitLeftShift PORT MAP(controller => pLoadL, clk => g_clk, reset => globalRes, shiftIn => vcc, enable => leftIn, inp => "00000001",
													output0 => LMASKout(0), output1 => LMASKout(1), output2 => LMASKout(2), output3 => LMASKout(3), output4 => LMASKout(4),
													output5 => LMASKout(5), output6 => LMASKout(6), output7 => LMASKout(7), NOToutput => open);
	
	RMASK: eightBitRightShift PORT MAP(controller => pLoadR, clk => g_clk, reset => globalRes, shiftIn => vcc, enable => rightIn, inp => "10000000",
													output0 => RMASKout(0), output1 => RMASKout(1), output2 => RMASKout(2), output3 => RMASKout(3), output4 => RMASKout(4),
													output5 => RMASKout(5), output6 => RMASKout(6), output7 => RMASKout(7), NOToutput => open);
	
	mux4: fourMux port map(uw0 => "00000000", uw1 => LMASKout, uw2 => RMASKout, uw3 => leftOrRight, s0 => leftIn, s1 => rightIn, uy => mux4Out);
	
	mux2: h2InMux port map(w0 => mux4Out, w1 => "00000000", en => pLoadD, y => mux2Out);
	
	Display: eightBitRightShift PORT MAP(controller => vcc, clk => g_clk, reset => globalRes, shiftIn => vcc, enable => displayCont, inp => mux2Out,
													output0 => led(0), output1 => led(1), output2 => led(2), output3 => led(3), output4 => led(4),
													output5 => led(5), output6 => led(6), output7 => led(7), NOToutput => open);
	
	
end structData;

