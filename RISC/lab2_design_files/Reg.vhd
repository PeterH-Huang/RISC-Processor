library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg is
	port (clock, reset, RegWrite : in std_logic;
	ReadRegister1, ReadRegister2, WriteRegister : in std_logic_vector(2 downto 0);
	WriteData : in std_logic_vector(7 downto 0);
	ReadData1, ReadData2 : out std_logic_vector(7 downto 0);
	o_WriteReg	: out std_logic_vector(7 downto 0);
	o_en : out std_logic_vector(7 downto 0);
	o_ReadData : out std_logic_vector(63 downto 0)
	);
end Reg;

architecture arch of Reg is

	component sixtyFourBitRegister is
		PORT(
			i_resetBar		: IN	STD_LOGIC;
			i_enable		: IN	STD_LOGIC_VECTOR(7 downto 0);
			i_clock			: IN	STD_LOGIC;
			i_Value			: IN	STD_LOGIC_VECTOR(63 downto 0);
			o_output		: OUT	STD_LOGIC_VECTOR(63 downto 0));
	END component;

	component decoder3to8 is
		port(
			a: in std_logic_vector(2 downto 0);
			b: out std_logic_vector(7 downto 0)
		);
	end component;

	component eight_bit_eightXoneMUX is
		Port(
		i_mux1		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux2		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux3		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux4		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux5		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux6		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux7		: IN STD_LOGIC_VECTOR(7 downto 0);
		i_mux8		: IN STD_LOGIC_VECTOR(7 downto 0);
		
		i_mux_sel	: IN STD_LOGIC_VECTOR(2 downto 0);
		
		o_mux_output: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	component  eightBitAND is

		port(A : in STD_LOGIC_VECTOR(7 downto 0);      
			 B : in STD_LOGIC_VECTOR(7 downto 0);      
			 Y : out STD_LOGIC_VECTOR(7 downto 0));    
	
	end component;

	signal s_WriteRegister : std_logic_vector(7 downto 0);
	signal s_ReadData: std_logic_vector(63 downto 0);
	signal s_en: STD_LOGIC_vector(7 downto 0);
	signal s_and: std_logic_vector(7 downto 0);
	signal s_c: std_logic_vector(7 downto 0);
	signal s_register: std_logic_vector(63 downto 0);
	


	begin

		s_and(0) <= RegWrite;
		s_and(1) <= RegWrite;
		s_and(2) <= RegWrite;
		s_and(3) <= RegWrite;
		s_and(4) <= RegWrite;
		s_and(5) <= RegWrite;
		s_and(6) <= RegWrite;
		s_and(7) <= RegWrite;

		writer: decoder3to8 port map(WriteRegister, s_WriteRegister);
		
		o_WriteReg <= s_WriteRegister;

		c: eightBitAND port map(s_and, s_WriteRegister,s_en);
		
		o_en <= s_en;

		s_register(63 downto 56) <= WriteData;
		s_register(55 downto 48) <= WriteData;
		s_register(47 downto 40) <= WriteData;
		s_register(39 downto 32) <= WriteData;
		s_register(31 downto 24) <= WriteData;
		s_register(23 downto 16) <= WriteData;
		s_register(15 downto 8) <= WriteData;
		s_register(7 downto 0) <= WriteData;

		regis:  sixtyFourBitRegister port map(reset, s_en, clock , s_register ,s_ReadData);
		
		o_ReadData <= s_ReadData;

		reader1:  eight_bit_eightXoneMUX port map(s_ReadData(7 downto 0),s_ReadData(15 downto 8),s_ReadData(23 downto 16),s_ReadData(31 downto 24),s_ReadData(39 downto 32),s_ReadData(47 downto 40),s_ReadData(55 downto 48),s_ReadData(63 downto 56),ReadRegister1, ReadData1);

		reader2:  eight_bit_eightXoneMUX port map(
		s_ReadData(7 downto 0),
		s_ReadData(15 downto 8),
		s_ReadData(23 downto 16),
		s_ReadData(31 downto 24),
		s_ReadData(39 downto 32),
		s_ReadData(47 downto 40),
		s_ReadData(55 downto 48),
		s_ReadData(63 downto 56),
		ReadRegister2,
		ReadData2);
	
end arch;