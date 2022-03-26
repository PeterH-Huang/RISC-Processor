LIBRARY ieee;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eight_bit_logical_or IS
    PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(7 downto 0);
        o_Or           : OUT   STD_LOGIC_VECTOR(7 downto 0));
END eight_bit_logical_or;

ARCHITECTURE rtl OF eight_bit_logical_or IS
    

BEGIN
    
    o_Or(0) <=   i_Ai(0) or i_Bi(0);
    o_Or(1) <=   i_Ai(1) or i_Bi(1);
    o_Or(2) <=   i_Ai(2) or i_Bi(2);
    o_Or(3) <=   i_Ai(3) or i_Bi(3);
    o_Or(4) <=   i_Ai(4) or i_Bi(4);
    o_Or(5) <=   i_Ai(5) or i_Bi(5);
    o_Or(6) <=   i_Ai(6) or i_Bi(6);
    o_Or(7) <=   i_Ai(7) or i_Bi(7); 
            
    


END rtl;
