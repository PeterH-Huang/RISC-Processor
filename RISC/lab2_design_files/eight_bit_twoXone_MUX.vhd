library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eight_bit_twoXone_mux is
    port(
        i_inp1, i_inp2: in std_logic_vector(7 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(7 downto 0)
    );
end entity eight_bit_twoXone_mux;
    
architecture RTL of eight_bit_twoXone_mux is
    
    component twoXoneMUX PORT(
            i_inp1      : IN STD_LOGIC;
            i_inp2      : IN STD_LOGIC;
            i_sel       : IN STD_LOGIC;
            o_output    : OUT STD_LOGIC);
            
    end component;
    
begin
bitSeven : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(7),
            i_inp2   => i_inp2(7),
            i_sel    => i_sel,
            o_output => o_output(7)
        );
        
bitSix : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(6),
            i_inp2   => i_inp2(6),
            i_sel    => i_sel,
            o_output => o_output(6)
        );
        
bitFive : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(5),
            i_inp2   => i_inp2(5),
            i_sel    => i_sel,
            o_output => o_output(5)
        );
        
bitFour : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(4),
            i_inp2   => i_inp2(4),
            i_sel    => i_sel,
            o_output => o_output(4)
        );
        
bitThree : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(3),
            i_inp2   => i_inp2(3),
            i_sel    => i_sel,
            o_output => o_output(3)
        );
        
bitTwo : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(2),
            i_inp2   => i_inp2(2),
            i_sel    => i_sel,
            o_output => o_output(2)
        );
        
bitOne : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(1),
            i_inp2   => i_inp2(1),
            i_sel    => i_sel,
            o_output => o_output(1)
        );
        
bitZero : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(0),
            i_inp2   => i_inp2(0),
            i_sel    => i_sel,
            o_output => o_output(0)
        );
        
end architecture RTL;

