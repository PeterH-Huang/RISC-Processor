
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY twoXoneMUX IS PORT(
			i_inp1		: IN STD_LOGIC;
			i_inp2		: IN STD_LOGIC;
			i_sel		: IN STD_LOGIC;
			o_output	: OUT STD_LOGIC);
END twoXoneMUX;

ARCHITECTURE rtl of twoXoneMUX IS SIGNAL
	int_and1, int_and2, int_or : STD_LOGIC:='0';

BEGIN

	int_and2 <= i_sel AND i_inp2;

	int_and1 <= (NOT i_sel) AND i_inp1;
	
	int_or <= int_and2 OR int_and1;

-- Output Driver
o_output <= int_or;

END rtl ;