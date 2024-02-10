library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Dlatch is 
port(
	Din		: in std_logic;
	enable	: in std_logic;
	z		: out std_logic
);
end entity;

architecture arch of Dlatch is 

begin 
	process(Din, enable)
	begin 
		if enable = '1' then
			z <= Din;
		else 
			z <= 'Z';
		end if;	
	end process;

end architecture;