LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU IS
    PORT(
        i_A, i_B              : IN    STD_LOGIC_VECTOR(7 downto 0);
        i_Operation           : IN  STD_LOGIC_VECTOR(2 downto 0);
        o_ALUResult           : OUT STD_LOGIC_VECTOR(7 downto 0);
        o_Zero                : OUT STD_LOGIC;
        o_Overflow            : OUT STD_LOGIC);
END ALU;

ARCHITECTURE rtl OF ALU IS
    
    component eight_bit_logical_and IS
    PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(7 downto 0);
        o_And           : OUT   STD_LOGIC_VECTOR(7 downto 0));
end component;

    component eight_bit_logical_or IS
    PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(7 downto 0);
        o_Or           : OUT   STD_LOGIC_VECTOR(7 downto 0));
end component;

    component eight_bit_adder_subtructor IS
    PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(7 downto 0);
        i_op            : IN    STD_LOGIC;
        o_Overflow      : OUT   STD_LOGIC;
        o_CarryOut      : OUT   STD_LOGIC;
        o_Sum           : OUT   STD_LOGIC_VECTOR(7 downto 0));
end component;

    component eight_bit_inverter IS PORT(
            i_Ai        : IN STD_LOGIC_VECTOR(7 downto 0);
            o_inv       : OUT STD_LOGIC_VECTOR(7 downto 0));
end component;

    component ALUOp_MUX is
    port(
        i_inp0, i_inp1  : in std_logic_vector(7 downto 0);
        i_inp2, i_inp3  : in std_logic_vector(7 downto 0);
        i_sel           : in std_logic_vector(1 downto 0);
        o_output : out std_logic_vector(7 downto 0));
    end component;
	 
	 component eight_bit_twoXone_mux is
    port(
        i_inp1, i_inp2: in std_logic_vector(7 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(7 downto 0)
    );
	 end component;
    
    signal int_AND  : STD_LOGIC_VECTOR(7 downto 0);
    signal int_OR   : STD_LOGIC_VECTOR(7 downto 0);
    signal int_SUM  : STD_LOGIC_VECTOR(7 downto 0);
    signal int_BINV : STD_LOGIC_VECTOR(7 downto 0);
    signal int_LESS : STD_LOGIC;
    signal int_Overflow : STD_LOGIC;
    signal int_CarryOut : STD_LOGIC;
	 signal int_opB	: std_logic_vector(7 downto 0); 
    
BEGIN
    
logicalAND: entity work.eight_bit_logical_and
    port map(
        i_Ai  => i_A,
        i_Bi  => i_B,
        o_And => int_AND
    );
    
logicalOR : entity work.eight_bit_logical_or
    port map(
        i_Ai => i_A,
        i_Bi => i_B,
        o_Or => int_OR
    );
    
bInvert : entity work.eight_bit_inverter
    port map(
        i_Ai  => i_B,
        o_inv => int_BINV
    );
	 
sub_MUX: entity work.eight_bit_twoXone_mux
    port map(
        i_inp1 =>i_B, 
		  i_inp2 =>int_BINV,
        i_sel          => i_Operation(2),
        o_output 		  =>int_opB
    );
    
adderSubtructor : entity work.eight_bit_adder_subtructor
    port map(
        i_Ai       => i_A,
        i_Bi       => int_opB,
        i_op       => i_Operation(2),
        o_Overflow => int_Overflow,
        o_CarryOut => int_CarryOut,
        o_Sum      => int_SUM
    );
    
lessthan : entity work.twoXoneMUX
    port map(
        i_inp1   => int_SUM(7),
        i_inp2   => int_CarryOut,
        i_sel    => int_Overflow,
        o_output => int_LESS
    );

ALUOpMUX : entity work.ALUOp_MUX
    port map(
        i_inp0   => int_AND,
        i_inp1   => int_OR,
        i_inp2   => int_SUM,
        i_inp3(7 downto 1)   => "0000000",
        i_inp3(0) => int_LESS,
        i_sel    => i_Operation(1 downto 0),
        o_output => o_ALUResult
    );
    
--concurrent signal assignment--


--output driver--
o_Zero <= not   (
                int_SUM(7) or
                int_SUM(6) or
                int_SUM(5) or
                int_SUM(4) or
                int_SUM(3) or
                int_SUM(2) or
                int_SUM(1) or
                int_SUM(0) 
                );


o_Overflow <= int_Overflow;


END rtl;
