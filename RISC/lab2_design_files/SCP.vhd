library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SCP is
    port(
        i_clock : in std_logic;
		  i_clock_fast : in std_logic;
        i_resetBar : in std_logic;
		  i_mux_sel		: in std_logic_vector(2 downto 0);
		  o_MuxOut		: out std_logic_vector(7 downto 0);
		  o_InstructionOut		: out std_logic_vector(31 downto 0);
		  o_ClockDiv4			: out std_logic;
		  o_ReadAddress		: out std_logic_vector(7 downto 0);
		  o_ALUResult			: out std_logic_vector(7 downto 0);			
		  o_ReadData1			: out std_logic_vector(7 downto 0);
		  o_ReadData2			: out std_logic_vector(7 downto 0);
		  o_WriteData			: out std_logic_vector(7 downto 0);
		  o_MemWriteOut		: out std_logic;
		  o_RegWriteOut		: out std_logic;
		  o_BranchOut		: out std_logic;
		  o_Zero					: out std_logic;
		  o_RegDst				: out std_logic;
		  o_Jump					: out std_logic;
		  o_MemRead				: out std_logic;
		  o_MemtoReg			: out std_logic;
		  o_ALUOp				: out std_logic_vector(1 downto 0);
		  o_ALUSrc  			: out std_logic 
    );
end entity SCP;

architecture RTL of SCP is

	component eight_bit_eightXoneMUX IS PORT(
			i_mux1		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux2		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux3		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux4		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux5		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux6		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux7		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_mux8		: IN STD_LOGIC_VECTOR(7 downto 0);
            
			i_mux_sel	: IN STD_LOGIC_VECTOR(2 downto 0);
			
			o_mux_output: OUT STD_LOGIC_VECTOR(7 downto 0));
	end component;
    
	 
	component two_bit_counter IS
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_en				: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_ClockDiv4		: OUT 	STD_LOGIC);
	end component;
	
	component clk_div IS

	PORT
	(
		clock_25Mhz				: IN	STD_LOGIC;
		clock_1MHz				: OUT	STD_LOGIC;
		clock_100KHz				: OUT	STD_LOGIC;
		clock_10KHz				: OUT	STD_LOGIC;
		clock_1KHz				: OUT	STD_LOGIC;
		clock_100Hz				: OUT	STD_LOGIC;
		clock_10Hz				: OUT	STD_LOGIC;
		clock_1Hz				: OUT	STD_LOGIC);
	end component;
	
    component thirtytwo_bit_register IS
    PORT(
        i_resetBar      : IN    STD_LOGIC;
        i_en            : IN    STD_LOGIC;
        i_clock         : IN    STD_LOGIC;
        i_Value         : IN    STD_LOGIC_VECTOR(31 downto 0);
        o_output        : OUT   STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component thirtytwo_bit_adder is
     PORT(
        i_Ai, i_Bi      : IN    STD_LOGIC_VECTOR(31 downto 0);
        i_op            : IN    STD_LOGIC;
        o_Overflow      : OUT   STD_LOGIC;
        o_CarryOut      : OUT   STD_LOGIC;
        o_Sum           : OUT   STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component instructionROM IS
    PORT
    (
        address     : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        clock       : IN STD_LOGIC  := '1';
        q       : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
    end component;
    
    component Control is
    port(
        i_Op        : in std_logic_vector(5 downto 0);
        o_RegDst    : out std_logic;
        o_ALUSrc    : out std_logic;
        o_MemtoReg  : out std_logic;
        o_RegWrite  : out std_logic;
        o_MemRead   : out std_logic;
        o_MemWrite  : out std_logic;
        o_Branch    : out std_logic;
        o_ALUOp       : out std_logic_vector(1 downto 0)
    );
    end component;
    
    component five_bit_twoXone_MUX is
    port(
        i_inp1, i_inp2: in std_logic_vector(4 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(4 downto 0)
    );
    end component;
    
    component Reg is
    port (
    clock, reset, RegWrite                      : in std_logic;
    ReadRegister1, ReadRegister2, WriteRegister : in std_logic_vector(2 downto 0);
    WriteData                                   : in std_logic_vector(7 downto 0);
    ReadData1, ReadData2                        : out std_logic_vector(7 downto 0)
    );
    end component;
    
    component sign_extend IS PORT(
            i_inp       : IN STD_LOGIC_VECTOR(15 downto 0);
            o_output    : OUT STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component eight_bit_twoXone_mux is
    port(
        i_inp1, i_inp2: in std_logic_vector(7 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(7 downto 0)
    );
    end component;
    
    component ALU IS
    PORT(
        i_A, i_B              : IN  STD_LOGIC_VECTOR(7 downto 0);
        i_Operation           : IN  STD_LOGIC_VECTOR(7 downto 0);
        o_ALUResult           : OUT STD_LOGIC_VECTOR(7 downto 0);
        o_Zero                : OUT STD_LOGIC;
        o_Overflow            : OUT STD_LOGIC);
    end component;
    
    component shift_left_2 IS PORT(
            i_inp       : IN STD_LOGIC_VECTOR(31 downto 0);
            o_output    : OUT STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component thirtytwo_bit_twoXone_mux is
    port(
        i_inp1, i_inp2: in std_logic_vector(7 downto 0);
        i_sel           : in std_logic;
        o_output : out std_logic_vector(7 downto 0)
    );
    end component;
    
    component dataRAM IS
    PORT
    (
        address     : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        clock       : IN STD_LOGIC  := '1';
        data        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        rden        : IN STD_LOGIC  := '1';
        wren        : IN STD_LOGIC ;
        q       : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
    end component;
    signal int_nextReadAddress : STD_LOGIC_VECTOR(31 downto 0);
    signal int_ReadAddress : STD_LOGIC_VECTOR(31 downto 0);
    signal int_Instruction : STD_LOGIC_VECTOR (31 DOWNTO 0);
    signal int_pc4overflow : STD_LOGIC;
    signal int_pc4cout : STD_LOGIC;
    signal int_PCplus4 : STD_LOGIC_VECTOR(31 downto 0);
    signal int_RegDst : std_logic;
    signal int_ALUSrc : std_logic;
    signal int_MemtoReg : std_logic;
    signal int_RegWrite : std_logic;
    signal int_MemRead : std_logic;
    signal int_MemWrite : std_logic;
    signal int_Branch : std_logic;
    signal int_ALUOp : std_logic_vector(1 downto 0);
    signal int_WriteRegister : std_logic_vector(4 downto 0);
    signal int_WriteData : std_logic_vector(7 downto 0);
    signal int_ReadData1 : std_logic_vector(7 downto 0);
    signal int_ReadData2 : std_logic_vector(7 downto 0);
    signal int_SignExtend : STD_LOGIC_VECTOR(31 downto 0);
    signal int_ShiftLeft2 : STD_LOGIC_VECTOR(31 downto 0);
    signal int_OperandB : std_logic_vector(7 downto 0);
    signal int_Operation : STD_LOGIC_VECTOR(2 downto 0);
    signal int_nextaddrroverflow : STD_LOGIC;
    signal int_nextaddrrcout : STD_LOGIC;
    signal int_ALUResult : STD_LOGIC_VECTOR(7 downto 0);
    signal int_Zero : STD_LOGIC;
    signal int_ALUOverflow : STD_LOGIC;
    signal int_BranchAddress : std_logic_vector(31 downto 0);
    signal int_BranchSelect : std_logic;
    signal int_ReadData : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal int_clock200HZ 	: std_logic;
	signal int_clock200KHZ 	: std_logic;
	signal int_clock20HZ	: std_logic;
	signal int_clock20KHZ	: std_logic;
	signal int_clock2HZ		: std_logic;
	signal int_clock2KHZ	: std_logic;
	signal int_clock2MHZ	: std_logic;
	signal int_nextAddress : std_logic_vector(31 downto 0);
	signal int_JumpAddress : std_logic_vector(31 downto 0);
	signal int_Jump : std_logic; 
	signal int_ClockDiv4 : std_logic;
    
begin

clk_div4: entity work.two_bit_counter
	PORT MAP(
		i_resetBar	=> i_resetBar,
		i_en			=> '1',
		i_clock		=> i_clock,
		o_ClockDiv4	=> int_ClockDiv4);
		
o_ClockDiv4 <= int_ClockDiv4;

clk: entity work.clk_div
    port map(
        clock_25Mhz	=> i_clock,
		clock_1MHz => int_clock2MHZ,
		clock_100KHz =>int_clock200KHZ,
		clock_10KHz =>int_clock20KHZ,
		clock_1KHz =>int_clock2KHZ,
		clock_100Hz =>int_clock200HZ,
		clock_10Hz =>int_clock20HZ,
		clock_1Hz =>int_clock2HZ
    );
    
pc_reg: entity work.thirtytwo_bit_register
    port map(
        i_resetBar => i_resetBar,
        i_en       => '1',
        i_clock    => int_ClockDiv4,
        i_Value    => int_nextReadAddress,
        o_output   => int_ReadAddress
    );
    
i_mem: entity work.instructionROM
    port map(
        address => int_ReadAddress(7 downto 0),
        clock   => i_clock,
        q       => int_Instruction
    );    
    
pc_plus4: entity work.thirtytwo_bit_adder
    port map(
        i_Ai       => int_ReadAddress,
        i_Bi       => (2 =>'1', others=>'0'),
        i_op       => '0',
        o_Overflow => int_pc4overflow,
        o_CarryOut => int_pc4cout,
        o_Sum      => int_PCplus4
    );    
    
cpu_control: entity work.Control
    port map(
        i_Op       => int_Instruction(31 downto 26),
        o_RegDst   => int_RegDst,
        o_ALUSrc   => int_ALUSrc,
        o_MemtoReg => int_MemtoReg,
        o_RegWrite => int_RegWrite,
        o_MemRead  => int_MemRead,
        o_MemWrite => int_MemWrite,
        o_Branch   => int_Branch,
		  o_Jump	    => int_Jump,
        o_ALUOp    => int_ALUOp
    );    
    
write_MUX: entity work.five_bit_twoXone_MUX
    port map(
        i_inp1   => int_Instruction(20 downto 16),
        i_inp2   => int_Instruction(15 downto 11),
        i_sel    => int_RegDst,
        o_output => int_WriteRegister
    );    
    
registers: entity work.Reg
    port map(
        clock         => int_ClockDiv4,
        reset         => i_resetBar,
        RegWrite      => int_RegWrite,
        ReadRegister1 => int_Instruction(23 downto 21),
        ReadRegister2 => int_Instruction(18 downto 16),
        WriteRegister => int_WriteRegister(2 downto 0),
        WriteData     => int_WriteData,
        ReadData1     => int_ReadData1,
        ReadData2     => int_ReadData2
    );    
    
extend: entity work.sign_extend
    port map(
        i_inp    => int_Instruction(15 downto 0),
        o_output => int_SignExtend
    );    
    
sl_two: entity work.shift_left_2
    port map(
        i_inp    => int_SignExtend,
        o_output => int_ShiftLeft2
    );    
    
opb_MUX: entity work.eight_bit_twoXone_mux
    port map(
        i_inp1   => int_ReadData2,
        i_inp2   => int_SignExtend(7 downto 0),
        i_sel    => int_ALUSrc,
        o_output => int_OperandB
    );    
    
alu_control:entity work.ALU_control
    port map(
        i_ALUOp     => int_ALUOp,
        i_F         => int_Instruction(3 downto 0),
        o_Operation => int_Operation
    );    
    
next_address: entity work.thirtytwo_bit_adder
    port map(
        i_Ai       => int_PCplus4,
        i_Bi       => int_ShiftLeft2,
        i_op       => '0',
        o_Overflow => int_nextaddrroverflow,
        o_CarryOut => int_nextaddrrcout,
        o_Sum      => int_BranchAddress
    );    
    
alu_cpu: entity work.ALU
    port map(
        i_A         => int_ReadData1,
        i_B         => int_OperandB,
        i_Operation => int_Operation,
        o_ALUResult => int_ALUResult,
        o_Zero      => int_Zero,
        o_Overflow  => int_ALUOverflow
    );    
    
branchaddress_mux: entity work.thirtytwo_bit_twoXone_mux
    port map(
        i_inp1   => int_PCplus4,
        i_inp2   => int_BranchAddress,
        i_sel    => int_BranchSelect,
        o_output => int_nextAddress
    );

nextRaddress_mux: entity work.thirtytwo_bit_twoXone_mux
    port map(
        i_inp1   => int_nextAddress,
        i_inp2   => int_JumpAddress,
        i_sel    => int_Jump,
        o_output => int_nextReadAddress
    );    
    
data_mem: entity work.dataRAM
    port map(
        address => int_ALUResult,
        clock   => i_clock,
        data    => int_ReadData2,
        rden    => int_MemRead,
        wren    => int_MemWrite,
        q       => int_ReadData
    );    
    
memtoreg_MUX: entity work.eight_bit_twoXone_mux
    port map(
        i_inp1   => int_ALUResult,
        i_inp2   => int_ReadData,
        i_sel    => int_MemtoReg,
        o_output => int_WriteData
    );

MUX_OUT: entity work.eight_bit_eightXoneMUX port map(
			i_mux1		=> int_ReadAddress(7 downto 0),
			i_mux2		=> int_ALUResult,
			i_mux3		=>	int_ReadData1,
			i_mux4		=> int_ReadData2,
			i_mux5		=> int_writeData,
			i_mux6		=> (7=> int_Zero,
								6=> int_RegDst,
								5=> int_Jump,
								4=> int_Memread,
								3=> int_MemtoReg,
								2=> int_ALUOp(1),
								1=> int_ALUOp(0),
								0=> int_ALUSrc),
			i_mux7		=> (7=> int_Zero,
								6=> int_RegDst,
								5=> int_Jump,
								4=> int_Memread,
								3=> int_MemtoReg,
								2=> int_ALUOp(1),
								1=> int_ALUOp(0),
								0=> int_ALUSrc),
			i_mux8		=> (7=> int_Zero,
								6=> int_RegDst,
								5=> int_Jump,
								4=> int_Memread,
								3=> int_MemtoReg,
								2=> int_ALUOp(1),
								1=> int_ALUOp(0),
								0=> int_ALUSrc),
            
			i_mux_sel	=> i_mux_sel,
			
			o_mux_output=> o_MuxOut);
			
--jump address--
int_JumpAddress(27 downto 2) 	<= int_Instruction(25 downto 0);
int_JumpAddress(1 downto 0) 	<= "00";
int_JumpAddress(31 downto 28)	<= int_PCplus4(31 downto 28);

--branch signal--
int_BranchSelect <= int_Branch and int_Zero;

--output driver--
o_InstructionOut 	<= int_Instruction;
o_BranchOut			<= int_BranchSelect;
o_MemWriteOut		<= int_MemWrite;
o_RegWriteOut		<= int_RegWrite;
o_ReadAddress		<= int_ReadAddress(7 downto 0);
o_ALUResult			<=	int_ALUResult;			
o_ReadData1			<= int_ReadData1;
o_ReadData2			<= int_ReadData2;
o_WriteData			<= int_writeData;
o_Zero				<= int_Zero;
o_RegDst				<= int_RegDst;
o_Jump				<= int_Jump;
o_MemRead			<= int_MemRead;
o_MemtoReg			<= int_MemtoReg;
o_ALUOp				<= int_ALUOp;
o_ALUSrc  			<= int_ALUSrc;    

end architecture RTL;
