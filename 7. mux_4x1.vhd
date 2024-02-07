library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mux_4x1 is
port(

	a,b,c,d:in std_logic;
	SEL: std_logic_vector(1 downto 0);
	z:out std_logic
);
end entity;

architecture arch of mux_4x1 is
begin

	process(a,b,c,d,SEL)
	begin
		case SEL is
			when "00" => z <= a;
			when "01" => z <= b;
			when "10" => z <= c;
			when "11" => z <= d;
			when others => null;
		end case;
	end process;

end architecture;