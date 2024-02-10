library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comparator is
port(
	a : in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	z: out std_logic
);
end entity;

architecture arch of comparator is
begin

	process(a,b)
	begin	
		if a=b then
			z <= '1';
		else z <= '0';
		end if;	
	end process;

end architecture;