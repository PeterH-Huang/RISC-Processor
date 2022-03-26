library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity eightBitAND is

    port(A : in STD_LOGIC_VECTOR(7 downto 0);    
         B : in std_logic_VECTOR(7 downto 0);      
         Y : out std_logic_VECTOR(7 downto 0));    

end eightBitAND;

-- Architecture definition

architecture logic of eightBitAND is

 begin
    
    Y <= A AND B;

end logic; 