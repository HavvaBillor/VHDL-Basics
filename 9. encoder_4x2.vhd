library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity encoder_4x2 is
	port(
		a: in std_logic_vector(3 downto 0);
		b: out std_logic_vector(1 downto 0)
	);
end entity;

architecture arch of encoder_4x2 is 
begin 
	process(a)
	begin 
		case a is
			when "0001" => b <= "00";
			when "0010" => b <= "01";
			when "0100" => b <= "10";
			when "1000" => b <= "11";
			when others => null;		
		end case;	
	end process;

end architecture;