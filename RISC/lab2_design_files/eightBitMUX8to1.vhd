LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eight_bit_eightXoneMUX IS PORT(
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
END eight_bit_eightXoneMUX;

ARCHITECTURE rtl of eight_bit_eightXoneMUX IS 

component eightXoneMUXp PORT(
			i_inp1		: IN STD_LOGIC;
			i_inp2		: IN STD_LOGIC;
			i_inp3		: IN STD_LOGIC;
			i_inp4		: IN STD_LOGIC;
            i_inp5		: IN STD_LOGIC;
			i_inp6		: IN STD_LOGIC;
			i_inp7		: IN STD_LOGIC;
			i_inp8		: IN STD_LOGIC;
			i_sel1		: IN STD_LOGIC;
			i_sel2		: IN STD_LOGIC;
            i_sel3		: IN STD_LOGIC;
			o_output	: OUT STD_LOGIC);
END component;

BEGIN

sevenMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(7), 
					i_inp2 => i_mux2(7),
					i_inp3 => i_mux3(7),
					i_inp4 => i_mux4(7),
               i_inp5 => i_mux5(7), 
					i_inp6 => i_mux6(7),
					i_inp7 => i_mux7(7),
					i_inp8 => i_mux8(7),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(7));

sixMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(6), 
					i_inp2 => i_mux2(6),
					i_inp3 => i_mux3(6),
					i_inp4 => i_mux4(6),
               i_inp5 => i_mux5(6), 
					i_inp6 => i_mux6(6),
					i_inp7 => i_mux7(6),
					i_inp8 => i_mux8(6),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(6));

fiveMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(5), 
					i_inp2 => i_mux2(5),
					i_inp3 => i_mux3(5),
					i_inp4 => i_mux4(5),
               i_inp5 => i_mux5(5), 
					i_inp6 => i_mux6(5),
					i_inp7 => i_mux7(5),
					i_inp8 => i_mux8(5),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(5));

fourMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(4), 
					i_inp2 => i_mux2(4),
					i_inp3 => i_mux3(4),
					i_inp4 => i_mux4(4),
               i_inp5 => i_mux5(4), 
					i_inp6 => i_mux6(4),
					i_inp7 => i_mux7(4),
					i_inp8 => i_mux8(4),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(4));

threeMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(3), 
					i_inp2 => i_mux2(3),
					i_inp3 => i_mux3(3),
					i_inp4 => i_mux4(3),
               i_inp5 => i_mux5(3), 
					i_inp6 => i_mux6(3),
					i_inp7 => i_mux7(3),
					i_inp8 => i_mux8(3),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(3));

twoMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(2), 
					i_inp2 => i_mux2(2),
					i_inp3 => i_mux3(2),
					i_inp4 => i_mux4(2),
               i_inp5 => i_mux5(2), 
					i_inp6 => i_mux6(2),
					i_inp7 => i_mux7(2),
					i_inp8 => i_mux8(2),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(2));

oneMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(1), 
					i_inp2 => i_mux2(1),
					i_inp3 => i_mux3(1),
					i_inp4 => i_mux4(1),
               i_inp5 => i_mux5(1), 
					i_inp6 => i_mux6(1),
					i_inp7 => i_mux7(1),
					i_inp8 => i_mux8(1),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(1));

zeroMux: entity work.eightXoneMUXp PORT MAP(
					i_inp1 => i_mux1(0), 
					i_inp2 => i_mux2(0),
					i_inp3 => i_mux3(0),
					i_inp4 => i_mux4(0),
               i_inp5 => i_mux5(0), 
					i_inp6 => i_mux6(0),
					i_inp7 => i_mux7(0),
					i_inp8 => i_mux8(0),
					i_sel1 => i_mux_sel(0),
					i_sel2 => i_mux_sel(1),
               i_sel3 => i_mux_sel(2),
					o_output => o_mux_output(0));
END rtl ;