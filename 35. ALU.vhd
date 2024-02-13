library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is 
port(
	SEL : in std_logic_vector(2 downto 0);
	A,B : in std_logic_vector(3 downto 0);
	Z   :out std_logic_vector(3 downto 0)
);
end entity;

architecture arch of ALU is

begin 
	
	process(SEL,A,B)
	begin 
		case SEL is 
			when "000" => Z <= A + B;
			when "001" => Z <= A - B;
			when "010" => Z <= A + '1';
			when "011" => Z <= A - '1';
			when "100" => Z <= A and B;
			when "101" => Z <= A or B;
			when "110" => Z <= A xor B;
			when "111" => Z <= not A;
			when others => null;
		end case;
	
	end process;

end architecture;