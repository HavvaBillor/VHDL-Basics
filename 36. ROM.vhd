library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ROM is
port(

	d_out	: out std_logic_vector(7 downto 0);
	address : in std_logic_vector(3 downto 0);
	clk 	:in std_logic;
	rd 		:in std_logic
);
end entity;

architecture arch of ROM is 

	type din is array ( 15 downto 0) of std_logic_vector(7 downto 0);
	constant datain: din :=
	("00110011","00000011","00110011","00111111","01110011","01110011","00110001","00110001",
	"00110010","01110011","00101011","00110011","10110011","10110011","00110011","00110000");
	
begin 

	process(clk)
	begin 
		if clk='1' and clk'event then
			if rd ='1'then 
				d_out <= datain ( conv_integer (address));
			end if;
		end if;
	end process;

end architecture;