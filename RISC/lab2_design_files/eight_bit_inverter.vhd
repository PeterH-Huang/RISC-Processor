
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eight_bit_inverter IS PORT(
            i_Ai        : IN STD_LOGIC_VECTOR(7 downto 0);
            o_inv       : OUT STD_LOGIC_VECTOR(7 downto 0));
END eight_bit_inverter;

ARCHITECTURE rtl of eight_bit_inverter IS 

BEGIN

    o_inv(0) <= not i_Ai(0);
    o_inv(1) <= not i_Ai(1);
    o_inv(2) <= not i_Ai(2);
    o_inv(3) <= not i_Ai(3);
    o_inv(4) <= not i_Ai(4);
    o_inv(5) <= not i_Ai(5);
    o_inv(6) <= not i_Ai(6);
    o_inv(7) <= not i_Ai(7);

END rtl ;