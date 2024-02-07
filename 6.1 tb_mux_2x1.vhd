library ieee;
use ieee.std_logic_1164.all;

entity tb_mux_2x1 is
--port();
end entity;

architecture arch of tb_mux_2x1 is

component  mux_2x1 is 
port(
	a	:in std_logic;
	b	:in std_logic;
	SEL	:in std_logic;
	c	:out std_logic
);
end component;

signal a:std_logic;
signal b:std_logic;
signal SEL:std_logic;
signal c:std_logic;

begin 

uut: mux_2x1 port map(

	a=>a,
	b=>b,
	SEL=>SEL,
	c=>c
);

stim_proc: process
begin
	SEL<='0';
	a<='0';
	b<='0';
	wait for 10ns;
	
	SEL<='0';
	a<='1';
	b<='0';
	wait for 10ns;
	
	SEL<='0';
	a<='0';
	b<='1';
	wait for 10ns;
	
	SEL<='0';
	a<='1';
	b<='1';
	wait for 10ns;
	
	SEL<='1';
	a<='0';
	b<='0';
	wait for 10ns;
	
	SEL<='1';
	a<='1';
	b<='0';
	wait for 10ns;
	
	SEL<='1';
	a<='0';
	b<='1';
	wait for 10ns;
	
	SEL<='1';
	a<='1';
	b<='1';
	wait for 10ns;
	
	wait;
end process;

end architecture;