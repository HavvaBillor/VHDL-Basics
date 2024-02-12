library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity D_flipflop is
port(
	D_in: in std_logic;
	clk : in std_logic;
	Q: out std_logic
);
end entity;

architecture arch of D_flipflop is
begin 
	process(clk)
	begin 
		if(rising_edge(clk)) then 
			Q <= D_in;
		end if;
	end process;
	
end architecture;