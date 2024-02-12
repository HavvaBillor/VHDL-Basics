library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity gray_updown is
port(
	clk : in std_logic;
	rst : in std_logic;
	Z 	: out std_logic_vector(3 downto 0);
	mode: in std_logic
);
end entity;

architecture arch of gray_updown is 

signal count : std_logic_vector(3 downto 0);

begin

	incr_count_proc: process(clk,rst,mode)
		begin
			if rst ='1' then 
				count <= "0000";
			elsif clk = '1' and clk'event then 
				case mode is
					when '1' => count <= count + 1;
					when '0' => count <= count - 1;
					when others => null;
				end case;
			end if;
		end process;

	output_proc: process ( count)
	begin 
	
		Z <= count(3) & (count(3) xor (count(2))) & (count(2) xor (count(1))) & (count(1) xor (count(0)));
		
	end process;


end architecture;