library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity thirtytwo_bit_adder is
     PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(31 downto 0);
        i_op            : IN    STD_LOGIC;
        o_Overflow      : OUT   STD_LOGIC;
        o_CarryOut      : OUT   STD_LOGIC;
        o_Sum           : OUT   STD_LOGIC_VECTOR(31 downto 0));
end entity thirtytwo_bit_adder;

architecture RTL of thirtytwo_bit_adder is
    
SIGNAL int_Sum, int_CarryOut : STD_LOGIC_VECTOR(31 downto 0);

    COMPONENT oneBitAdder
    PORT(
        i_CarryIn       : IN    STD_LOGIC;
        i_Ai, i_Bi      : IN    STD_LOGIC;
        o_Sum, o_CarryOut   : OUT   STD_LOGIC);
    END COMPONENT;
    

BEGIN


add31: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(30), 
              i_Ai => i_Ai(31),
              i_Bi => i_Bi(31),
              o_Sum => int_Sum(31),
              o_CarryOut => int_CarryOut(31));
              
add30: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(29), 
              i_Ai => i_Ai(30),
              i_Bi => i_Bi(30),
              o_Sum => int_Sum(30),
              o_CarryOut => int_CarryOut(30));
              
              
add29: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(28), 
              i_Ai => i_Ai(29),
              i_Bi => i_Bi(29),
              o_Sum => int_Sum(29),
              o_CarryOut => int_CarryOut(29));
              
add28: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(27), 
              i_Ai => i_Ai(28),
              i_Bi => i_Bi(28),
              o_Sum => int_Sum(28),
              o_CarryOut => int_CarryOut(28));             

add27: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(26), 
              i_Ai => i_Ai(27),
              i_Bi => i_Bi(27),
              o_Sum => int_Sum(27),
              o_CarryOut => int_CarryOut(27));

add26: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(25), 
              i_Ai => i_Ai(26),
              i_Bi => i_Bi(26),
              o_Sum => int_Sum(26),
              o_CarryOut => int_CarryOut(26));

add25: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(24), 
              i_Ai => i_Ai(25),
              i_Bi => i_Bi(25),
              o_Sum => int_Sum(25),
              o_CarryOut => int_CarryOut(25));
              
add24: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(23), 
              i_Ai => i_Ai(24),
              i_Bi => i_Bi(24),
              o_Sum => int_Sum(24),
              o_CarryOut => int_CarryOut(24));

add23: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(22), 
              i_Ai => i_Ai(23),
              i_Bi => i_Bi(23),
              o_Sum => int_Sum(23),
              o_CarryOut => int_CarryOut(23));

add22: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(21), 
              i_Ai => i_Ai(22),
              i_Bi => i_Bi(22),
              o_Sum => int_Sum(22),
              o_CarryOut => int_CarryOut(22));
              
add21: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(20), 
              i_Ai => i_Ai(21),
              i_Bi => i_Bi(21),
              o_Sum => int_Sum(21),
              o_CarryOut => int_CarryOut(21));
              
              
add20: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(19), 
              i_Ai => i_Ai(20),
              i_Bi => i_Bi(20),
              o_Sum => int_Sum(20),
              o_CarryOut => int_CarryOut(20));
              
add19: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(18), 
              i_Ai => i_Ai(19),
              i_Bi => i_Bi(19),
              o_Sum => int_Sum(19),
              o_CarryOut => int_CarryOut(19));             

add18: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(17), 
              i_Ai => i_Ai(18),
              i_Bi => i_Bi(18),
              o_Sum => int_Sum(18),
              o_CarryOut => int_CarryOut(18));

add17: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(16), 
              i_Ai => i_Ai(17),
              i_Bi => i_Bi(17),
              o_Sum => int_Sum(17),
              o_CarryOut => int_CarryOut(17));
              
add16: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(15), 
              i_Ai => i_Ai(16),
              i_Bi => i_Bi(16),
              o_Sum => int_Sum(16),
              o_CarryOut => int_CarryOut(16));

add15: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(14), 
              i_Ai => i_Ai(15),
              i_Bi => i_Bi(15),
              o_Sum => int_Sum(15),
              o_CarryOut => int_CarryOut(15));

add14: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(13), 
              i_Ai => i_Ai(14),
              i_Bi => i_Bi(14),
              o_Sum => int_Sum(14),
              o_CarryOut => int_CarryOut(14));
              
add13: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(12), 
              i_Ai => i_Ai(13),
              i_Bi => i_Bi(13),
              o_Sum => int_Sum(13),
              o_CarryOut => int_CarryOut(13));
              
              
add12: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(11), 
              i_Ai => i_Ai(12),
              i_Bi => i_Bi(12),
              o_Sum => int_Sum(12),
              o_CarryOut => int_CarryOut(12));
              
add11: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(10), 
              i_Ai => i_Ai(11),
              i_Bi => i_Bi(11),
              o_Sum => int_Sum(11),
              o_CarryOut => int_CarryOut(11));             

add10: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(9), 
              i_Ai => i_Ai(10),
              i_Bi => i_Bi(10),
              o_Sum => int_Sum(10),
              o_CarryOut => int_CarryOut(10));

add9: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(8), 
              i_Ai => i_Ai(9),
              i_Bi => i_Bi(9),
              o_Sum => int_Sum(9),
              o_CarryOut => int_CarryOut(9));
              
add8: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(7), 
              i_Ai => i_Ai(8),
              i_Bi => i_Bi(8),
              o_Sum => int_Sum(8),
              o_CarryOut => int_CarryOut(8));

add7: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(6), 
              i_Ai => i_Ai(7),
              i_Bi => i_Bi(7),
              o_Sum => int_Sum(7),
              o_CarryOut => int_CarryOut(7));

add6: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(5), 
              i_Ai => i_Ai(6),
              i_Bi => i_Bi(6),
              o_Sum => int_Sum(6),
              o_CarryOut => int_CarryOut(6));
              
add5: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(4), 
              i_Ai => i_Ai(5),
              i_Bi => i_Bi(5),
              o_Sum => int_Sum(5),
              o_CarryOut => int_CarryOut(5));
              
              
add4: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(3), 
              i_Ai => i_Ai(4),
              i_Bi => i_Bi(4),
              o_Sum => int_Sum(4),
              o_CarryOut => int_CarryOut(4));
              
add3: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(2), 
              i_Ai => i_Ai(3),
              i_Bi => i_Bi(3),
              o_Sum => int_Sum(3),
              o_CarryOut => int_CarryOut(3));             

add2: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(1), 
              i_Ai => i_Ai(2),
              i_Bi => i_Bi(2),
              o_Sum => int_Sum(2),
              o_CarryOut => int_CarryOut(2));

add1: oneBitAdder
    PORT MAP (i_CarryIn => int_CarryOut(0), 
              i_Ai => i_Ai(1),
              i_Bi => i_Bi(1),
              o_Sum => int_Sum(1),
              o_CarryOut => int_CarryOut(1));
                           
add0: oneBitAdder
    PORT MAP (i_CarryIn => i_op, 
              i_Ai => i_Ai(0),
              i_Bi => i_Bi(0),
              o_Sum => int_Sum(0),
              o_CarryOut => int_CarryOut(0));

              
    -- Output Driver
    o_Sum <= int_Sum;
    o_Overflow <= int_CarryOut(31) xor int_CarryOut(30);
    o_CarryOut <= int_CarryOut(31);

end architecture RTL;
