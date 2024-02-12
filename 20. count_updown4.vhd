library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity count_updown4 is
port(
	clk : in std_logic;
	rst : in std_logic;
	Z 	: out std_logic_vector(3 downto 0);
	mode: in std_logic
);
end entity;

architecture arch of count_updown4 is 

signal count : std_logic_vector(3 downto 0);

begin 

	process(clk,rst)
	begin 
	
		if rst ='1' then 
			count <= "0000";
		elsif clk = '1' and clk'event then
			if mode ='1' then --up counting mode
				count <= count +1 ;
				Z<= count ;
			else -- down counting mode
				count <= count -1 ;
				Z <= count;
			end if;
		end if;	
	end process;

end architecture;