library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity xor_gate is
port(
	a:in std_logic;
	b:in std_logic;
	c:out std_logic
);
end entity;

architecture arch of xor_gate is
begin
	c <= a xor b;

end architecture;