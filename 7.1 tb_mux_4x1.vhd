library ieee;
use ieee.std_logic_1164.all;

entity tb_mux_4x1 is 
-- port();
end entity;

architecture arch of tb_mux_4x1 is 

component  mux_4x1 is
port(

	a,b,c,d:in std_logic;
	SEL: std_logic_vector(1 downto 0);
	z:out std_logic
);
end component;

signal a	: std_logic;
signal b	: std_logic;
signal c	: std_logic;
signal d	: std_logic;
signal SEL	: std_logic_vector(1 downto 0);
signal z	: std_logic;

begin 

uut: mux_4x1 port map(

	a	=> a,
    b	=> b,
	c	=> c,
    d	=> d,
    SEL	=> SEL,
	z	=> z	
);

stim_proc: process 
	begin 
	
	SEL <= "00";
	a<= '0';
	b<= '1';
	c<= '0';
	d<= '1';
	wait for 10ns;
	
	SEL <= "01";
	a<= '0';
	b<= '1';
	c<= '0';
	d<= '1';
	wait for 10ns;
	
	SEL <= "10";
	a<= '0';
	b<= '1';
	c<= '0';
	d<= '1';
	wait for 10ns;
	
	SEL <= "11";
	a<= '0';
	b<= '1';
	c<= '0';
	d<= '1';
	wait for 10ns;
	
	SEL <= "00";
	a<= '1';
	b<= '0';
	c<= '1';
	d<= '1';
	wait for 10ns;
	
	SEL <= "01";
	a<= '1';
	b<= '0';
	c<= '1';
	d<= '1';
	wait for 10ns;
	
	wait;		
	end process;

end architecture;