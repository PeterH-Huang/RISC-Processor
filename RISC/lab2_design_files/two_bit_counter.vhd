
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY two_bit_counter IS
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_en			: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_ClockDiv4		: OUT 	STD_LOGIC);
END two_bit_counter;

ARCHITECTURE rtl OF two_bit_counter IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL int_d2, int_d1, int_d0 : STD_LOGIC;

	COMPONENT enardFF_2
			PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d			: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

--concurrent signal assignment--

int_d2 <= int_Value(2) xor (int_Value(1) and int_Value(0));
int_d1 <= int_Value(1) xor int_Value(0);
int_d0 <= int_notValue(0);


twoBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> int_d2,
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(2),
	          o_qBar 		=> int_notValue(1));

oneBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> int_d1,
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(1),
	          o_qBar 		=> int_notValue(1));

zeroBit: entity work.enardFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> int_d0,
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(0),
	          o_qBar 		=> int_notValue(0));

-- Output Driver
	o_ClockDiv4 <= int_Value(2);
END rtl;
