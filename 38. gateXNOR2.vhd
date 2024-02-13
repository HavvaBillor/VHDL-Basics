library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity gate_xnor is 
port(
	P,Q :in std_logic;
	R : out std_logic
);
end entity;

architecture arch of gate_xnor is 
begin

R <= P xnor Q;

end architecture;