
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY thirtytwo_bit_register IS
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_en			: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(31 downto 0);
		o_output		: OUT	STD_LOGIC_VECTOR(31 downto 0));
END thirtytwo_bit_register;

ARCHITECTURE rtl OF thirtytwo_bit_register IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(31 downto 0);

	COMPONENT enardFF_2
			PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d			: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN
    


thirtyoneBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(31),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(31),
              o_qBar        => int_notValue(31));

thirtyBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(30),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(30),
              o_qBar        => int_notValue(30));

twentynineBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(29),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(29),
              o_qBar        => int_notValue(29));

twentyeightBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(28),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(28),
              o_qBar        => int_notValue(28));

twentysevenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(27),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(27),
              o_qBar        => int_notValue(27));

twentysixBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(26),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(26),
              o_qBar        => int_notValue(26));

twentyfiveBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(25),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(25),
              o_qBar        => int_notValue(25));

twentyfourBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(24),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(24),
              o_qBar        => int_notValue(24));

twentythreeBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(23),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(23),
              o_qBar        => int_notValue(23));    

twentytwoBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(22),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(22),
              o_qBar        => int_notValue(22));

twentyoneBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(21),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(21),
              o_qBar        => int_notValue(21));

twentyBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(20),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(20),
              o_qBar        => int_notValue(20));

nineteenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(19),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(19),
              o_qBar        => int_notValue(19));

eighteenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(18),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(18),
              o_qBar        => int_notValue(18));

seventeenoBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(17),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(17),
              o_qBar        => int_notValue(17));

sixteenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(16),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(16),
              o_qBar        => int_notValue(16));

fifteenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(15),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(15),
              o_qBar        => int_notValue(15));

fourteenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(14),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(14),
              o_qBar        => int_notValue(14));

thirteenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(13),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(13),
              o_qBar        => int_notValue(13));

twelveBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(12),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(12),
              o_qBar        => int_notValue(12));

elevenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(11),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(11),
              o_qBar        => int_notValue(11));

tenBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(10),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(10),
              o_qBar        => int_notValue(10));

nineBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(9),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(9),
              o_qBar        => int_notValue(9));

eightBit: entity work.enARdFF_2
    PORT MAP (i_resetBar    => i_resetBar,              
              i_d           => i_Value(8),
              i_enable      => i_en,
              i_clock       => i_clock,
              o_q           => int_Value(8),
              o_qBar        => int_notValue(8));

sevenBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(7),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(7),
	          o_qBar 		=> int_notValue(7));

sixBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(6),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(6),
	          o_qBar 		=> int_notValue(6));

fiveBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(5),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(5),
	          o_qBar 		=> int_notValue(5));

fourBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(4),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(4),
	          o_qBar 		=> int_notValue(4));

threeBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(3),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(3),
	          o_qBar 		=> int_notValue(3));

twoBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(2),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(2),
	          o_qBar 		=> int_notValue(2));

oneBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(1),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(1),
	          o_qBar 		=> int_notValue(1));

zeroBit: entity work.enARdFF_2
	PORT MAP (i_resetBar 	=> i_resetBar,				
			  i_d 			=> i_Value(0),
			  i_enable		=> i_en,
			  i_clock 		=> i_clock,
			  o_q 			=> int_Value(0),
	          o_qBar 		=> int_notValue(0));

-- Output Driver
	o_output <= int_Value;
	
END rtl;
