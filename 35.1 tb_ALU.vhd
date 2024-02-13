library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_ALU is 
--port();
end entity;

architecture arch of tb_ALU is 

component ALU is 
port(
	SEL : in std_logic_vector(2 downto 0);
	A,B : in std_logic_vector(3 downto 0);
	Z   :out std_logic_vector(3 downto 0)
);
end component;

signal SEL 	:std_logic_vector(2 downto 0) := (others => '0');
signal A 	:std_logic_vector(3 downto 0):= (others => '0');
signal B 	:std_logic_vector(3 downto 0):= (others => '0');
signal Z 	:std_logic_vector(3 downto 0);

begin 

uut: ALU port map(
	SEL =>SEL,
    A 	=>A,
    B 	=>B,
    Z 	=>Z
);

stim_proc: process 
begin 

	wait for 10ns;

	SEL <= "000";
	A   <= "1001";
	B   <= "0101";
	wait for 10ns;
	
	SEL <= "011";
	wait for 10ns;
	
	SEL <= "110";
	wait for 10ns;
	
	SEL <= "010";
	wait for 10ns;
	
	SEL <= "111";
	wait for 10ns;

wait;
end process;

end architecture;