library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Control is
    port(
        i_Op        : in std_logic_vector(5 downto 0);
        o_RegDst    : out std_logic;
        o_ALUSrc    : out std_logic;
        o_MemtoReg  : out std_logic;
        o_RegWrite  : out std_logic;
        o_MemRead   : out std_logic;
        o_MemWrite  : out std_logic;
        o_Branch    : out std_logic;
		  o_Jump	     : out std_logic;
        o_ALUOp     : out std_logic_vector(1 downto 0)
    );
end entity Control;

architecture RTL of Control is
    
    signal int_Rformat     : std_logic;
    signal int_lw : std_logic;
    signal int_sw : std_logic;
    signal int_beq : std_logic;
	 signal int_jump	:std_logic;
    
begin
   
--concurrent signal assignment--   
    
    int_Rformat <= (
                    (not i_Op(5)) and
                    (not i_Op(4)) and
                    (not i_Op(3)) and
                    (not i_Op(2)) and
                    (not i_Op(1)) and
                    (not i_Op(0)) 
                    );
    
    
    int_lw      <= (
                    (i_Op(5)) and
                    (not i_Op(4)) and
                    (not i_Op(3)) and
                    (not i_Op(2)) and
                    (i_Op(1)) and
                    (i_Op(0)) 
                    );
    
    
    int_sw      <= (
                    (i_Op(5)) and
                    (not i_Op(4)) and
                    (i_Op(3)) and
                    (not i_Op(2)) and
                    (i_Op(1)) and
                    (i_Op(0)) 
                    );
    
    
    int_beq      <= (
                    (not i_Op(5)) and
                    (not i_Op(4)) and
                    (not i_Op(3)) and
                    (i_Op(2)) and
                    (not i_Op(1)) and
                    (not i_Op(0)) 
                    );
						  
	int_jump		 <= (
                    (not i_Op(5)) and
                    (not i_Op(4)) and
                    (not i_Op(3)) and
                    (not i_Op(2)) and
                    (i_Op(1)) and
                    (not i_Op(0)) 
                    );
                        

--output driver--
    
    o_RegDst    <= int_Rformat;
    o_ALUSrc    <= (
                    int_lw or
                    int_sw
                    );
    o_MemtoReg  <= int_lw;
    o_RegWrite  <= (
                    int_Rformat or
                    int_lw
                    );
    o_MemRead   <= int_lw;
    o_MemWrite  <= int_sw;
    o_Branch    <= int_beq;
    o_ALUOp(1)  <= int_Rformat;
    o_ALUOp(0)  <= int_beq;
	 o_Jump		 <= int_jump;
    
    


end architecture RTL;
