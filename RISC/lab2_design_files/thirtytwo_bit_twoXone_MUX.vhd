library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity thirtytwo_bit_twoXone_mux is
    port(
        i_inp1, i_inp2: in std_logic_vector(31 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(31 downto 0)
    );
end entity thirtytwo_bit_twoXone_mux;
    
architecture RTL of thirtytwo_bit_twoXone_mux is
    
    component twoXoneMUX PORT(
            i_inp1      : IN STD_LOGIC;
            i_inp2      : IN STD_LOGIC;
            i_sel       : IN STD_LOGIC;
            o_output    : OUT STD_LOGIC);
            
    end component;
    
begin
bit31 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(31),
            i_inp2   => i_inp2(31),
            i_sel    => i_sel,
            o_output => o_output(31)
        );
        
bit30 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(30),
            i_inp2   => i_inp2(30),
            i_sel    => i_sel,
            o_output => o_output(30)
        );
        
bit29 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(29),
            i_inp2   => i_inp2(29),
            i_sel    => i_sel,
            o_output => o_output(29)
        );
        
bit28 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(28),
            i_inp2   => i_inp2(28),
            i_sel    => i_sel,
            o_output => o_output(28)
        );
        
bit27 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(27),
            i_inp2   => i_inp2(27),
            i_sel    => i_sel,
            o_output => o_output(27)
        );
        
bit26 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(26),
            i_inp2   => i_inp2(26),
            i_sel    => i_sel,
            o_output => o_output(26)
        );
        
bit25 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(25),
            i_inp2   => i_inp2(25),
            i_sel    => i_sel,
            o_output => o_output(25)
        );
        
bit24 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(24),
            i_inp2   => i_inp2(24),
            i_sel    => i_sel,
            o_output => o_output(24)
        );

bit23 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(23),
            i_inp2   => i_inp2(23),
            i_sel    => i_sel,
            o_output => o_output(23)
        );
        
bit22 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(22),
            i_inp2   => i_inp2(22),
            i_sel    => i_sel,
            o_output => o_output(22)
        );
        
bit21 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(21),
            i_inp2   => i_inp2(21),
            i_sel    => i_sel,
            o_output => o_output(21)
        );
        
bit20 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(20),
            i_inp2   => i_inp2(20),
            i_sel    => i_sel,
            o_output => o_output(20)
        );
        
bit19 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(19),
            i_inp2   => i_inp2(19),
            i_sel    => i_sel,
            o_output => o_output(19)
        );
        
bit18 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(18),
            i_inp2   => i_inp2(18),
            i_sel    => i_sel,
            o_output => o_output(18)
        );
        
bit17 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(17),
            i_inp2   => i_inp2(17),
            i_sel    => i_sel,
            o_output => o_output(17)
        );
        
bit16 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(16),
            i_inp2   => i_inp2(16),
            i_sel    => i_sel,
            o_output => o_output(16)
        );

bit15 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(15),
            i_inp2   => i_inp2(15),
            i_sel    => i_sel,
            o_output => o_output(15)
        );
        
bit14 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(14),
            i_inp2   => i_inp2(14),
            i_sel    => i_sel,
            o_output => o_output(14)
        );
        
bit13 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(13),
            i_inp2   => i_inp2(13),
            i_sel    => i_sel,
            o_output => o_output(13)
        );
        
bit12 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(12),
            i_inp2   => i_inp2(12),
            i_sel    => i_sel,
            o_output => o_output(12)
        );
        
bit11 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(11),
            i_inp2   => i_inp2(11),
            i_sel    => i_sel,
            o_output => o_output(11)
        );
        
bit10 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(10),
            i_inp2   => i_inp2(10),
            i_sel    => i_sel,
            o_output => o_output(10)
        );
        
bit9 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(9),
            i_inp2   => i_inp2(9),
            i_sel    => i_sel,
            o_output => o_output(9)
        );
        
bit8 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(8),
            i_inp2   => i_inp2(8),
            i_sel    => i_sel,
            o_output => o_output(8)
        );

bit7 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(7),
            i_inp2   => i_inp2(7),
            i_sel    => i_sel,
            o_output => o_output(7)
        );
        
bit6 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(6),
            i_inp2   => i_inp2(6),
            i_sel    => i_sel,
            o_output => o_output(6)
        );
        
bit5 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(5),
            i_inp2   => i_inp2(5),
            i_sel    => i_sel,
            o_output => o_output(5)
        );
        
bit4 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(4),
            i_inp2   => i_inp2(4),
            i_sel    => i_sel,
            o_output => o_output(4)
        );
        
bit3 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(3),
            i_inp2   => i_inp2(3),
            i_sel    => i_sel,
            o_output => o_output(3)
        );
        
bit2 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(2),
            i_inp2   => i_inp2(2),
            i_sel    => i_sel,
            o_output => o_output(2)
        );
        
bit1 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(1),
            i_inp2   => i_inp2(1),
            i_sel    => i_sel,
            o_output => o_output(1)
        );
        
bit0 : entity work.twoXoneMUX
        port map(
            i_inp1   => i_inp1(0),
            i_inp2   => i_inp2(0),
            i_sel    => i_sel,
            o_output => o_output(0)
        );
        
end architecture RTL;

