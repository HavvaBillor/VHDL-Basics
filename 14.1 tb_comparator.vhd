library ieee;
use ieee.std_logic_1164.all;

entity tb_comparator is 
--port();
end entity;

architecture arch of tb_comparator is

component comparator is
port(
	a : in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	z: out std_logic
);
end component;

signal a: std_logic_vector(3 downto 0) := (others=> '0');
signal b: std_logic_vector(3 downto 0):= (others=> '0');
signal z: std_logic;

begin

uut: comparator port map(
	a=>a,
	b=>b,
	z=>z
);

stim_proc: process
	begin 

		a<= "1010";
		b<= "1010";
		wait for 10ns;
		
		a<= "0010";
		b<= "1110";
		wait for 10ns;
		
		a<= "1010";
		b<= "0010";
		wait for 10ns;
		
		a<= "0110";
		b<= "1010";
		wait for 10ns;
		
		a<= "1000";
		b<= "1000";
		wait for 10ns;
		
		wait;
	end process;

end architecture;