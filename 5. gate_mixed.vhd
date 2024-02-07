library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity gate_mixed is
port(
	a,b :in std_logic;
	outAND,outOR,outXOR,outNOT,outNAND,outXNOR,outNOR : out std_logic
);
end entity;

architecture arch of gate_mixed is
begin

outAND  <= a and b;
outOR   <= a or b;
outXOR  <= a xor b;
outNOT  <=   not(a);
outNAND <= a nand b;
outXNOR <= a xnor b;
outNOR  <= a nor b;


end architecture;