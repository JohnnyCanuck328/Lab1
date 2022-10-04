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
ENTITY eightbitshiftregister IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		controller: in std_logic;
		shiftIn: in std_logic;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
END eightbitshiftregister;

ARCHITECTURE rtl OF eightbitshiftregister IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(7 downto 0);
	signal loadOp: std_logic_vector(7 downto 0);
	signal shiftOp: std_logic_vector(7 downto 0);
	signal regIn: std_logic_vector(7 downto 0);
	signal NOTcontroller: std_logic;
	

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


shiftOp(7) <= NOTcontroller AND int_Value(6);
shiftOp(6) <= NOTcontroller AND int_Value(5);
shiftOp(5) <= NOTcontroller AND int_Value(4);
shiftOp(4) <= NOTcontroller AND int_Value(3);
shiftOp(3) <= NOTcontroller AND int_Value(2);
shiftOp(2) <= NOTcontroller AND int_Value(1);
shiftOp(1) <= NOTcontroller AND int_Value(0);
shiftOp(0) <= NOTcontroller AND shiftIn;

loadOp(7) <= controller AND i_Value(7);
loadOp(6) <= controller AND i_Value(6);
loadOp(5) <= controller AND i_Value(5);
loadOp(4) <= controller AND i_Value(4);
loadOp(3) <= controller AND i_Value(3);
loadOp(2) <= controller AND i_Value(2);
loadOp(1) <= controller AND i_Value(1);
loadOp(0) <= controller AND i_Value(0);

regIn(7) <= loadOp(7) OR shiftOp(7);
regIn(6) <= loadOp(6) OR shiftOp(6);
regIn(5) <= loadOp(5) OR shiftOp(5);
regIn(4) <= loadOp(4) OR shiftOp(4);
regIn(3) <= loadOp(3) OR shiftOp(3);
regIn(2) <= loadOp(2) OR shiftOp(2);
regIn(1) <= loadOp(1) OR shiftOp(1);
regIn(0) <= loadOp(0) OR shiftOp(0);


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
