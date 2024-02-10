library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
--port();
end entity;

architecture arch of tb_full_adder is

component full_adder is
port(
	a: in std_logic;
	b: in std_logic;
	c: in std_logic;
	
	sum: out std_logic;
	carry:out std_logic
);
end component;

signal a:std_logic;
signal b:std_logic;
signal c:std_logic;
signal sum:std_logic;
signal carry:std_logic;

begin

uut: full_adder port map(
	a =>a,
	b=>b,
	c=>c,
	sum=>sum,
	carry=>carry
);

stim_proc: process
begin 

	a <= '0';
	b <= '0';
	c <= '0';
	wait for 10 ns;	
	
	a <= '1';
	b <= '0';
	c <= '0';
	wait for 10 ns;
	
	
	a <= '0';
	b <= '1';
	c <= '0';
	wait for 10 ns;	
	
	a <= '1';
	b <= '1';
	c <= '0';
	wait for 10 ns;
	
	a <= '0';
	b <= '0';
	c <= '1';
	wait for 10 ns;	
	
	a <= '1';
	b <= '0';
	c <= '1';
	wait for 10 ns;
	
	a <= '0';
	b <= '1';
	c <= '1';
	wait for 10 ns;
	
	a <= '1';
	b <= '1';
	c <= '1';
	wait for 10 ns;
	
	wait;
end process;



end architecture;