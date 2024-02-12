library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipo is 
port(
	clk 		: in std_logic;
	paralel_in	: in std_logic_vector(3 downto 0);
	paralel_out : out std_logic_vector(3 downto 0)
);
end entity;

architecture arch of pipo is
 
begin

	process(clk)
	begin 
		if clk = '1' and clk'event then 
			paralel_out <= paralel_in;
		end if;
	end process;
	
end architecture;