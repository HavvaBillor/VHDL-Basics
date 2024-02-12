library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity piso is
port(
	clk 		: in std_logic;
	load		: in std_logic;
	serial_out  : out std_logic;
	paralel_in 	: in std_logic_vector(3 downto 0)
);
end entity;

architecture arch of piso is 

signal data : std_logic_vector(3 downto 0);

begin

	process(clk)
	begin 
		if clk ='1' and clk'event then 
			if load = '1' then
				data <= paralel_in;
				serial_out <= 'Z';
			else 
				data <= data(2 downto 0) & '0';
				serial_out <= data(3);
			end if;			
		end if;	
	end process;

end architecture;