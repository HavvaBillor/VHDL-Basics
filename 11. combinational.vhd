library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity combinational is 
	port(

		A				: in std_logic; 						-- 1st data input 2:1 mux
		B				: in std_logic; 						--2nd data input 2:1 mux
		S				: in std_logic;							-- select of 2:1 mux 
		MUX2			: out std_logic; 						-- output of 2:1 mux
		
		C 				: in std_logic;         				--1st data input 4:1 mux
		D 				: in std_logic;         				--2nt data input 4:1 mux
		E				: in std_logic;         				--3rd data input 4:1 mux
		F 				: in std_logic;         				--4th data input 4:1 mux
		SEL 			: in std_logic_vector(1 downto 0); 		-- select of 4:1 mux
		MUX4			: out std_logic; 						-- output of 4:1 mux
		
		EnIn			: in std_logic_vector(3 downto 0); 		-- 4 bit in data of encoder 4x2
		EnOUT			: out std_logic_vector(1 downto 0); 	-- 2 bit out data of encoder 4x2
		
		DecdIN			: in std_logic_vector(1 downto 0);  	-- 2 bit in data of decoder 2x4
		DecdOUT			: out std_logic_vector(3 downto 0)  	-- 4 bit out data of decoder 2x4

	);
end entity;

architecture arch of combinational is 
begin 

	MUX2 <= A when s = '0' else B;

	MUX4 <= C when SEL = "00" else
			D when SEL = "01" else
			E when SEL = "10" else
			F when SEL = "11" else 
			'Z';
	
	EnOUT <= "00" when EnIn = "0001" else
			 "01" when EnIn = "0010" else
			 "10" when EnIn = "0100" else
			 "11" when EnIn = "1000" else
			 "ZZ";

	DecdOUT <= "0001" when DecdIN = "00" else
			   "0010" when DecdIN = "01" else
			   "0100" when DecdIN = "10" else
			   "1000" when DecdIN = "11" else
			   "0000";
end architecture;
