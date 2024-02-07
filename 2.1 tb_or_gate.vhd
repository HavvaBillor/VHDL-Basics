library ieee;
use ieee.std_logic_1164.all;

entity tb_or_gate is 
-- port();
end entity;

architecture arch of tb_or_gate is 

component or_gate is
	port(
		a,b:in std_logic;
		c:out std_logic
);
end component;

signal a: std_logic;
signal b: std_logic;
signal c: std_logic;

begin

uut: or_gate port map(
	a => a,
	b =>b,
	c=>c
);
stim_proc: process 
begin 
	a <= '0';
	b <='0';
	wait for 10ns;
	
	a <= '1';
	b <='0';
	wait for 10ns;
	
	a <= '0';
	b <='1';
	wait for 10ns;
	
	a <= '1';
	b <='1';
	wait for 10ns;
	
	wait;
	
end process;

end architecture;