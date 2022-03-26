LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sign_extend IS PORT(
            i_inp       : IN STD_LOGIC_VECTOR(15 downto 0);
            o_output    : OUT STD_LOGIC_VECTOR(31 downto 0));
END sign_extend;

ARCHITECTURE rtl of sign_extend IS 

BEGIN

-- Output Driver
o_output(31) <= i_inp(15);
o_output(30) <= i_inp(15);
o_output(29) <= i_inp(15);
o_output(28) <= i_inp(15);
o_output(27) <= i_inp(15);
o_output(26) <= i_inp(15);
o_output(25) <= i_inp(15);
o_output(24) <= i_inp(15);
o_output(23) <= i_inp(15);
o_output(22) <= i_inp(15);
o_output(21) <= i_inp(15);
o_output(20) <= i_inp(15);
o_output(19) <= i_inp(15);
o_output(18) <= i_inp(15);
o_output(17) <= i_inp(15);
o_output(16) <= i_inp(15);
o_output(15 downto 0) <= i_inp;
END rtl ;