library ieee;
use ieee.std_logic_1164.all;

entity tb_not_gate is 
--port();
end entity;

architecture arch of tb_not_gate is 

component  not_gate is
port(
	a: in std_logic;
	b: out std_logic
);
end component;

signal a:std_logic;
signal b:std_logic;

begin

uut: not_gate port map(
	a => a,
	b =>b
); 
 
stim_proc: process
begin
	a <= '0';
	wait for 10ns;
	
	a <= '1';
	wait for 10ns;
	
	wait;
	
end process;

end architecture;