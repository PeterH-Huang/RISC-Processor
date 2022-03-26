LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightXoneMUX IS PORT(
			i_inp		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_sel0      : IN STD_LOGIC;
			i_sel1		: IN STD_LOGIC;
			i_sel2		: IN STD_LOGIC;
			o_output	: OUT STD_LOGIC);
END eightXoneMUX;

ARCHITECTURE rtl of eightXoneMUX IS 
	
	component fourXoneMUX IS PORT(
            i_inp1      : IN STD_LOGIC;
            i_inp2      : IN STD_LOGIC;
            i_inp3      : IN STD_LOGIC;
            i_inp4      : IN STD_LOGIC;
            i_sel1      : IN STD_LOGIC;
            i_sel2      : IN STD_LOGIC;
            o_output    : OUT STD_LOGIC);
    end component;
    
    component twoXoneMUX IS PORT(
            i_inp1      : IN STD_LOGIC;
            i_inp2      : IN STD_LOGIC;
            i_sel       : IN STD_LOGIC;
            o_output    : OUT STD_LOGIC);
    end component;
    signal int_muxOutFirst : STD_LOGIC;
    signal int_muxOutSecond : STD_LOGIC;

BEGIN

first4INP: entity work.fourXoneMUX
    port map(
        i_inp1   => i_inp(0),
        i_inp2   => i_inp(1),
        i_inp3   => i_inp(2),
        i_inp4   => i_inp(3),
        i_sel1   => i_sel0,
        i_sel2   => i_sel1,
        o_output => int_muxOutFirst
    );
    
last4INP: entity work.fourXoneMUX
    port map(
        i_inp1   => i_inp(4),
        i_inp2   => i_inp(5),
        i_inp3   => i_inp(6),
        i_inp4   => i_inp(7),
        i_sel1   => i_sel0,
        i_sel2   => i_sel1,
        o_output => int_muxOutSecond
    );
  
outputMUX: entity work.twoXoneMUX
    port map(
        i_inp1   => int_muxOutFirst,
        i_inp2   => int_muxOutSecond,
        i_sel    => i_sel2,
        o_output => o_output
    );
	


END rtl ;