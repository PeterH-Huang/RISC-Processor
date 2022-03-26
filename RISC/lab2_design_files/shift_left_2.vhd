LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shift_left_2 IS PORT(
            i_inp       : IN STD_LOGIC_VECTOR(31 downto 0);
            o_output    : OUT STD_LOGIC_VECTOR(31 downto 0));
END shift_left_2;

ARCHITECTURE rtl of shift_left_2 IS 

BEGIN

-- Output Driver--
o_output(31 downto 2) <= i_inp(29 downto 0);
o_output(1 downto 0) <= "00";

END rtl ;