
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightBitRegister IS
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_en			: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_output		: OUT	STD_LOGIC_VECTOR(7 downto 0));
END eightBitRegister;

ARCHITECTURE rtl OF eightBitRegister IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(7 downto 0):="00000000";

	COMPONENT enardFF_2
			PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d			: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

sevenBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(7),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(7),
	          o_qBar 		=> int_notValue(7));

sixBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(6),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(6),
	          o_qBar 		=> int_notValue(6));

fiveBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(5),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(5),
	          o_qBar 		=> int_notValue(5));

fourBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(4),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(4),
	          o_qBar 		=> int_notValue(4));

threeBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(3),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(3),
	          o_qBar 		=> int_notValue(3));

twoBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(2),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(2),
	          o_qBar 		=> int_notValue(2));

oneBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(1),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(1),
	          o_qBar 		=> int_notValue(1));

zeroBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(0),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(0),
	          o_qBar 		=> int_notValue(0));

-- Output Driver
	o_output(7) <= int_Value(7);
	o_output(6) <= int_Value(6);
	o_output(5) <= int_Value(5);
	o_output(4) <= int_Value(4);
	o_output(3) <= int_Value(3);
	o_output(2) <= int_Value(2);
	o_output(1) <= int_Value(1);
	o_output(0) <= int_Value(0);
END rtl;
