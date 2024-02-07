library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mux_2x1 is 
port(
	a	:in std_logic;
	b	:in std_logic;
	SEL	:in std_logic;
	c	:out std_logic
);
end entity;

architecture arch of mux_2x1 is

begin 
	process(SEL,a,b)
	begin 
		case SEL is 
			when '0' => c <=a;
			when '1' => c <=b;
			when others => null;
		end case;
	end process;
end architecture;