library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALUOp_MUX is
    port(
        i_inp0, i_inp1  : in std_logic_vector(7 downto 0);
        i_inp2, i_inp3  : in std_logic_vector(7 downto 0);
        i_sel           : in std_logic_vector(1 downto 0);
        o_output : out std_logic_vector(7 downto 0)
    );
end entity ALUOp_MUX;
    
architecture RTL of ALUOp_MUX is
    
    component eightXoneMUX IS PORT(
            i_inp       : IN STD_LOGIC_VECTOR(7 downto 0);
            i_sel0      : IN STD_LOGIC;
            i_sel1      : IN STD_LOGIC;
            i_sel2      : IN STD_LOGIC;
            o_output    : OUT STD_LOGIC);
            
    end component;
    
begin
bitSeven : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(7),
            i_inp2   => i_inp1(7),
            i_inp3   => i_inp2(7),
            i_inp4   => i_inp3(7),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(7)
        );
        
bitSix : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(6),
            i_inp2   => i_inp1(6),
            i_inp3   => i_inp2(6),
            i_inp4   => i_inp3(6),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(6)
        );
        
bitFive : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(5),
            i_inp2   => i_inp1(5),
            i_inp3   => i_inp2(5),
            i_inp4   => i_inp3(5),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(5)
        );
        
bitFour : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(4),
            i_inp2   => i_inp1(4),
            i_inp3   => i_inp2(4),
            i_inp4   => i_inp3(4),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(4)
        );
        
bitThree : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(3),
            i_inp2   => i_inp1(3),
            i_inp3   => i_inp2(3),
            i_inp4   => i_inp3(3),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(3)
        );
        
bitTwo : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(2),
            i_inp2   => i_inp1(2),
            i_inp3   => i_inp2(2),
            i_inp4   => i_inp3(2),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(2)
        );
        
bitOne : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(1),
            i_inp2   => i_inp1(1),
            i_inp3   => i_inp2(1),
            i_inp4   => i_inp3(1),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(1)
        );
        
bitZero : entity work.fourXoneMUX
        port map(
            i_inp1   => i_inp0(0),
            i_inp2   => i_inp1(0),
            i_inp3   => i_inp2(0),
            i_inp4   => i_inp3(0),
            i_sel1    => i_sel(0),
            i_sel2    => i_sel(1),
            o_output => o_output(0)
        );
        
end architecture RTL;

