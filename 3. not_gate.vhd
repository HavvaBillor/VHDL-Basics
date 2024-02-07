library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity not_gate is
port(
	a: in std_logic;
	b: out std_logic
);
end entity;

architecture arch of not_gate is 
begin

b <= not(a);

end architecture;