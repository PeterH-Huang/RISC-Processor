LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sixtyFourBitRegister IS
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_enable		: IN	STD_LOGIC_VECTOR(7 downto 0);
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(63 downto 0);
		o_output		: OUT	STD_LOGIC_VECTOR(63 downto 0));
END sixtyFourBitRegister;

ARCHITECTURE rtl OF sixtyFourBitRegister IS
	SIGNAL int_Value : STD_LOGIC_VECTOR(63 downto 0);
	COMPONENT eightBitRegister
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_en			: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_output		: OUT	STD_LOGIC_VECTOR(7 downto 0));
	END COMPONENT;

BEGIN

sixtyThreeToFiftySix: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(7),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(63 downto 56),
		o_output		=> int_Value(63 downto 56)
    );

fiftyFiveToFourtyEight: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(6),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(55 downto 48),
		o_output		=> int_Value(55 downto 48)
    );

fourtySevenToFourty: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(5),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(47 downto 40),
		o_output		=> int_Value(47 downto 40)
    );

thrityNineToThirtyTwo: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(4),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(39 downto 32),
		o_output		=> int_Value(39 downto 32)
    );

thrityOneToTwentyFour: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(3),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(31 downto 24),
		o_output		=> int_Value(31 downto 24)
    );

twentyThreeToSixteen: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(2),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(23 downto 16),
		o_output		=> int_Value(23 downto 16)
    );

fifteenToEight: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(1),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(15 downto 8),
		o_output		=> int_Value(15 downto 8)
    );

zeroToSeven: entity work.eightBitRegister
    port map(
        i_resetBar 	    => i_resetBar,
		i_en			=> i_enable(0),
		i_clock 		=> i_clock,
		i_Value			=> i_Value	(7 downto 0),
		o_output		=> int_Value(7 downto 0)
    );

-- Output Driver
    o_output(63 downto 56) <= int_Value(63 downto 56);
	o_output(55 downto 48) <= int_Value(55 downto 48);
	o_output(47 downto 40) <= int_Value(47 downto 40);
	o_output(39 downto 32) <= int_Value(39 downto 32);
	o_output(31 downto 24) <= int_Value(31 downto 24);
	o_output(23 downto 16) <= int_Value(23 downto 16);
	o_output(15 downto 8) <= int_Value(15 downto 8);
	o_output(7 downto 0) <= int_Value(7 downto 0);

    end rtl;