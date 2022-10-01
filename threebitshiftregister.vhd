--------------------------------------------------------------------------------
-- Title         : 3-bit Shift Register
-- Project       : VHDL Synthesis Overview
-------------------------------------------------------------------------------
-- File          : threeBitShiftRegister.vhd
-- Author        : Rami Abielmona  <rabielmo@site.uottawa.ca>
-- Created       : 2003/05/17
-- Last modified : 2007/09/25
-------------------------------------------------------------------------------
-- Description : This file creates a 3-bit shift register as defined in the VHDL 
--		 Synthesis lecture. The architecture is done at the RTL 
--		 abstraction level and the implementation is done in structural
--		 VHDL.
-------------------------------------------------------------------------------
-- Modification history :
-- 2003.05.17 	R. Abielmona		Creation
-- 2004.09.22 	R. Abielmona		Ported for CEG 3550
-- 2007.09.25 	R. Abielmona		Modified copyright notice
-------------------------------------------------------------------------------
-- This file is copyright material of Rami Abielmona, Ph.D., P.Eng., Chief Research
-- Scientist at Larus Technologies.  Permission to make digital or hard copies of part
-- or all of this work for personal or classroom use is granted without fee
-- provided that copies are not made or distributed for profit or commercial
-- advantage and that copies bear this notice and the full citation of this work.
-- Prior permission is required to copy, republish, redistribute or post this work.
-- This notice is adapted from the ACM copyright notice.
--------------------------------------------------------------------------------

--adapted from allaboutcircuits.com/textbook/digital/chpt-12/parallel-in-parallel-out-universal-shift-register/

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


--notShiftDir is right shift
--
ENTITY eightBitUniversalReg IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		shiftDir, mode: in std_logic;
		rightShiftIn, leftShiftIn: in std_logic;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
END eightBitUniversalReg;

ARCHITECTURE rtl OF eightBitUniversalReg IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(7 downto 0);
	signal doShiftRight, doShiftLeft: std_logic_vector(7 downto 0);
	signal load: std_logic_vector(7 downto 0);
	signal NOTshiftDir, NOTmode: std_logic;
	signal regIn: std_logic_vector(7 downto 0);
	

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

--instaniate signals here
NOTshiftDir <= NOT(shiftDir);
NOTmode <= NOT(mode);

--controls right shifts
doShiftRight(7) <= mode AND NOTshiftDir AND rightShiftIn;
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(7);
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(6);
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(5);
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(4);
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(3);
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(2);
doShiftRight(7) <= mode AND NOTshiftDir AND int_Value(1);

doShiftLeft(7) <= mode AND shiftDir AND int_Value(6);
doShiftLeft(6) <= mode AND shiftDir AND int_Value(5);
doShiftLeft(5) <= mode AND shiftDir AND int_Value(4);
doShiftLeft(4) <= mode AND shiftDir AND int_Value(3);
doShiftLeft(3) <= mode AND shiftDir AND int_Value(2);
doShiftLeft(2) <= mode AND shiftDir AND int_Value(1);
doShiftLeft(1) <= mode AND shiftDir AND int_Value(0);
doShiftLeft(0) <= mode AND shiftDir AND leftShiftIn;

load(7) <= NOTmode AND i_Value(7);
load(6) <= NOTmode AND i_Value(6);
load(5) <= NOTmode AND i_Value(5);
load(4) <= NOTmode AND i_Value(4);
load(3) <= NOTmode AND i_Value(3);
load(2) <= NOTmode AND i_Value(2);
load(1) <= NOTmode AND i_Value(1);
load(0) <= NOTmode AND i_Value(0);

regIn(7) <= load(7) OR doShiftRight(7) OR doShiftLeft(7);
regIn(6) <= load(6) OR doShiftRight(6) OR doShiftLeft(6);
regIn(5) <= load(5) OR doShiftRight(5) OR doShiftLeft(5);
regIn(4) <= load(4) OR doShiftRight(4) OR doShiftLeft(4);
regIn(3) <= load(3) OR doShiftRight(3) OR doShiftLeft(3);
regIn(2) <= load(2) OR doShiftRight(2) OR doShiftLeft(2);
regIn(1) <= load(1) OR doShiftRight(1) OR doShiftLeft(1);
regIn(0) <= load(0) OR doShiftRight(0) OR doShiftLeft(0);


ff7: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(7), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(7),
	          o_qBar => int_notValue(7));

ff6: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(6),
			  i_enable => i_load, 
			  i_clock => i_clock,
			  o_q => int_Value(6),
	          o_qBar => int_notValue(6));

ff5: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(5), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(5),
	          o_qBar => int_notValue(5));
				 
ff4: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(4), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(4),
	          o_qBar => int_notValue(4));

ff3: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(3),
			  i_enable => i_load, 
			  i_clock => i_clock,
			  o_q => int_Value(3),
	          o_qBar => int_notValue(3));

ff2: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(2), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(2),
	          o_qBar => int_notValue(2));

ff1: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(1), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(1),
	          o_qBar => int_notValue(1));

ff0: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => regIn(0),
			  i_enable => i_load, 
			  i_clock => i_clock,
			  o_q => int_Value(0),
	          o_qBar => int_notValue(0));
			 

	-- Output Driver
	o_Value		<= int_Value;

END rtl;
