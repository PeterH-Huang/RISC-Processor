LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightXoneMUXp IS PORT(
			i_inp1		: IN STD_LOGIC;
			i_inp2		: IN STD_LOGIC;
			i_inp3		: IN STD_LOGIC;
			i_inp4		: IN STD_LOGIC;
            i_inp5		: IN STD_LOGIC;
			i_inp6		: IN STD_LOGIC;
			i_inp7		: IN STD_LOGIC;
			i_inp8		: IN STD_LOGIC;
			i_sel1		: IN STD_LOGIC;
			i_sel2		: IN STD_LOGIC;
            i_sel3		: IN STD_LOGIC;
			o_output	: OUT STD_LOGIC);
END eightXoneMUXp;

ARCHITECTURE rtl of eightXoneMUXp IS SIGNAL
	int_and1, int_and2, int_and3, int_and4, int_and5, int_and6, int_and7, int_and8, int_or : STD_LOGIC:='0';

BEGIN

	int_and8 <= i_sel1 AND i_sel2 AND i_sel3 AND i_inp8;

	int_and7 <= (not i_sel1) AND i_sel2 AND i_sel3 AND i_inp7;

	int_and6 <= i_sel1 AND (not i_sel2) AND i_sel3 AND i_inp6;
	
	int_and5 <= (not i_sel1) AND (not i_sel2) AND i_sel3 AND i_inp5;

	int_and4 <= i_sel1 AND i_sel2 AND (not i_sel3) AND i_inp4;

	int_and3 <= (not i_sel1) AND i_sel2 AND (not i_sel3) AND i_inp3;

	int_and2 <= i_sel1 AND (not i_sel2) AND (not i_sel3) AND i_inp2;
	
	int_and1 <= (not i_sel1) AND (not i_sel2) AND (not i_sel3) AND i_inp1;
	
	int_or <= int_and8 OR int_and7 OR int_and6 OR int_and5 OR int_and4 OR int_and3 OR int_and2 OR int_and1;

-- Output Driver
o_output <= int_or;

END rtl ;