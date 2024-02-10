library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity full_adder is
port(
	a: in std_logic;
	b: in std_logic;
	c: in std_logic;
	
	sum: out std_logic;
	carry:out std_logic
);
end entity;

architecture arch of full_adder is
begin 
	sum <= a xor b xor c;
	carry <= (a and b) or (a and c) or (b and c);

end architecture;