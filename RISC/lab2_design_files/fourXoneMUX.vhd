LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fourXoneMUX IS PORT(
			i_inp1		: IN STD_LOGIC;
			i_inp2		: IN STD_LOGIC;
			i_inp3		: IN STD_LOGIC;
			i_inp4		: IN STD_LOGIC;
			i_sel1		: IN STD_LOGIC;
			i_sel2		: IN STD_LOGIC;
			o_output	: OUT STD_LOGIC);
END fourXoneMUX;

ARCHITECTURE rtl of fourXoneMUX IS SIGNAL
	int_and1, int_and2, int_and3, int_and4, int_or : STD_LOGIC:='0';

BEGIN

	int_and4 <= i_sel1 AND i_sel2 AND i_inp4;

	int_and3 <= (NOT i_sel1) AND i_sel2 AND i_inp3;

	int_and2 <= i_sel1 AND (NOT i_sel2) AND i_inp2;
	
	int_and1 <= (NOT i_sel1) AND (NOT i_sel2) AND i_inp1;
	
	int_or <= int_and4 OR int_and3 OR int_and2 OR int_and1;

-- Output Driver
o_output <= int_or;

END rtl ;