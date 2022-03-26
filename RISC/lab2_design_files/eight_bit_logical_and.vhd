LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eight_bit_logical_and IS
    PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(7 downto 0);
        o_And           : OUT   STD_LOGIC_VECTOR(7 downto 0));
END eight_bit_logical_and;

ARCHITECTURE rtl OF eight_bit_logical_and IS
    

BEGIN
    
    o_And(0) <=   i_Ai(0) and i_Bi(0);
    o_And(1) <=   i_Ai(1) and i_Bi(1);
    o_And(2) <=   i_Ai(2) and i_Bi(2);
    o_And(3) <=   i_Ai(3) and i_Bi(3);
    o_And(4) <=   i_Ai(4) and i_Bi(4);
    o_And(5) <=   i_Ai(5) and i_Bi(5);
    o_And(6) <=   i_Ai(6) and i_Bi(6);
    o_And(7) <=   i_Ai(7) and i_Bi(7); 
            
    


END rtl;