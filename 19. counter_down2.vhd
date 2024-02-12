library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity counter_down2 is 
port(
	clk : in std_logic;
	rst : in std_logic;
	Z   : out std_logic_vector(1 downto 0)
);
end entity;

architecture arch of counter_down2 is 

signal count : std_logic_vector(1 downto 0);

begin 

	process(clk,rst)
	begin 
	
		if rst = '1' then
			count <= "11";
		elsif clk = '1' and clk'event  then
			count <= count - 1;
		end if;
	end process;
Z <= count ;

end architecture;