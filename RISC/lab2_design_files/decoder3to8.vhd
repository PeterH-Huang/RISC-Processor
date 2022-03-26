library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder3to8 is
    port(
        a: in std_logic_vector(2 downto 0);
        b: out std_logic_vector(7 downto 0)
    );
end decoder3to8; 

architecture rtl of decoder3to8 is 
begin
    b(0) <= not a(0) and not a(1) and not a(2);
    b(1) <= a(0) and not a(1) and not a(2);
    b(2) <= not a(0) and a(1) and not a(2);
    b(3) <= a(0) and a(1) and not a(2);
    b(4) <= not a(0) and not a(1) and a(2);
    b(5) <= a(0) and not a(1) and a(2);
    b(6) <= not a(0) and a(1) and a(2);
    b(7) <= a(0) and a(1) and a(2);
end rtl;



