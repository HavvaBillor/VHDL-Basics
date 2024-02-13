library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity gate_and is 
port(
	D,E,F,G :in std_logic;
	H      : out std_logic
);
end entity;

architecture arch of gate_and is 
begin

H <= ((D and E) and (F and G));

end architecture;