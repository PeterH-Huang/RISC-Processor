LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_control IS
    PORT(
        i_ALUOp               : IN    STD_LOGIC_VECTOR(1 downto 0);
        i_F                   : IN    STD_LOGIC_VECTOR(3 downto 0);
        o_Operation           : OUT   STD_LOGIC_VECTOR(2 downto 0));
END ALU_control;

ARCHITECTURE rtl OF ALU_control IS
    signal int_or_op0 : std_logic;
    signal int_and_op0 : std_logic;
    signal int_or_op1 : std_logic;
    signal int_and_op2 : std_logic;
    signal int_or_op2 : std_logic;
    
BEGIN
int_or_op0  <= i_F(3) or i_F(0);
int_and_op0 <= i_ALUOp(1) and int_or_op0;
int_or_op1  <= (not i_ALUOp(1)) or (not i_F(2));
int_and_op2 <= i_ALUOp(1) and i_F(1);
int_or_op2  <= i_ALUOp(0) or int_and_op2;

--output driver--
o_Operation(2)  <= int_or_op2;
o_Operation(1)  <= int_or_op1;
o_Operation(0)  <= int_and_op0;


END rtl;
