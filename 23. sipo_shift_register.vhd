library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sipo is
port(
	clk 		: in std_logic;
	serial_in  	: in std_logic;
	paralel_out : out std_logic_vector(3 downto 0)
);
end entity;

architecture arch of sipo is 

signal data : std_logic_vector(3 downto 0);

begin 
	
	process(clk)
	begin 
		if clk ='1' and clk'event then 
			data <= data(2 downto 0) & serial_in;
		end if;
	end process;

paralel_out <= data;


end architecture;