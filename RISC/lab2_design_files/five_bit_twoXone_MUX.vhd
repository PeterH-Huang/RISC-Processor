library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity five_bit_twoXone_MUX is
    port(
        i_inp1, i_inp2: in std_logic_vector(4 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(4 downto 0)
    );
end entity five_bit_twoXone_MUX;

architecture RTL of five_bit_twoXone_MUX is
    
    component twoXoneMUX PORT(
            i_inp1      : IN STD_LOGIC;
            i_inp2      : IN STD_LOGIC;
            i_sel       : IN STD_LOGIC;
            o_output    : OUT STD_LOGIC);
            
    end component;
    
begin
        
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
