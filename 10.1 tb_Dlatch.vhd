library ieee;
use ieee.std_logic_1164.all;

entity tb_Dlatch is 
--port();
end entity;

architecture arch of tb_Dlatch is 

component Dlatch is 
port(
	Din		: in std_logic;
	enable	: in std_logic;
	z		: out std_logic
);
end component;

signal Din		: std_logic;
signal enable	: std_logic;
signal z		: std_logic;

begin

uut: Dlatch port map(
	Din		=> Din,	
	enable	=> enable,
	z		=> z	
);

stim_proc: process
	begin 

		enable <= '1';
		Din <= '1';
		wait for 10ns;
		
		enable <= '1';
		Din <= '0';
		wait for 10ns;
		
		enable <= '0';
		Din <= '1';
		wait for 10ns;
		
		enable <= '0';
		Din <= '0';
		wait for 10ns;
		
		wait;
	end process;

end architecture;