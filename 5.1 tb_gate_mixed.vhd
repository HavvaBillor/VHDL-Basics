library ieee;
use ieee.std_logic_1164.all;

entity tb_gate_mixed is 
--port();
end entity;

architecture arch of tb_gate_mixed is 
component gate_mixed is
port(
	a,b :in std_logic;
	outAND,outOR,outXOR,outNOT,outNAND,outXNOR,outNOR : out std_logic
);
end component;

signal a		: std_logic;
signal b		: std_logic;
signal outAND	: std_logic;
signal outOR	: std_logic;
signal outXOR	: std_logic;
signal outNOT	: std_logic;
signal outNAND	: std_logic;
signal outXNOR	: std_logic;
signal outNOR	: std_logic;

begin
uut: gate_mixed port map(
	a		=> a,		
	b		=> b,		
	outAND	=> outAND,	
	outOR	=> outOR,	
	outXOR	=> outXOR,	
	outNOT	=> outNOT,	
	outNAND	=> outNAND,	
	outXNOR	=> outXNOR,	
	outNOR	=> outNOR	
);

stim_proc: process
begin
	a<= '0';
	b<= '0';
	wait for 10ns;
	
	a<= '1';
	b<= '0';
	wait for 10ns;
	
	a<= '0';
	b<= '1';
	wait for 10ns;
	
	a<= '1';
	b<= '1';
	wait for 10ns;
	
	wait;
	
end process;

end architecture;