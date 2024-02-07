library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity decoder_2x4 is 
	port(
		a: in std_logic_vector(1 downto 0);
		b: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arch of decoder_2x4 is
begin
	
	process(a)
	begin 
	
		case a is
			when "00" => b <= "0001";
			when "01" => b <= "0010";
			when "10" => b <= "0100";
			when "11" => b <= "1000";
			when others => null;
		end case;
	end process;
	
end architecture;