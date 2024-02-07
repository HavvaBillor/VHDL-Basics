library ieee;
use ieee.std_logic_1164.all;

entity tb_encoder_4x2 is
--port();
end entity;

architecture arch of tb_encoder_4x2 is 

component encoder_4x2 is
	port(
		a: in std_logic_vector(3 downto 0);
		b: out std_logic_vector(1 downto 0)
	);
end component;

signal a: std_logic_vector(3 downto 0);
signal b: std_logic_vector(1 downto 0);

begin 

uut: encoder_4x2 port map(
	a => a,
	b => b
);

stim_proc: process 
	begin 

		a<= "0001";
		wait for 10ns;
		
		a<= "0010";
		wait for 10ns;
		
		a<= "0100";
		wait for 10ns;
		
		a<= "1000";
		wait for 10ns;
		
		wait;		
	end process;

end architecture;
