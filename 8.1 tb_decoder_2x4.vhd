library ieee;
use ieee.std_logic_1164.all;

entity tb_decode_2x4 is 
--port();
end entity;

architecture arch of tb_decode_2x4 is 

component decoder_2x4 is 
	port(
		a: in std_logic_vector(1 downto 0);
		b: out std_logic_vector(3 downto 0)
	);
end component;

signal a: std_logic_vector(1 downto 0);
signal b: std_logic_vector(3 downto 0);

begin

uut: decoder_2x4 port map(
	a =>a,
	b =>b	
);

stim_proc : process 
	begin 
		a <= "00";
		wait for 10ns;
		
		a <= "01";
		wait for 10ns;
		
		a <= "10";
		wait for 10ns;
		
		a <= "11";
		wait for 10ns;
		
		wait;
	end process;

end architecture;