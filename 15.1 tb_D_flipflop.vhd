library ieee;
use ieee.std_logic_1164.all;

entity tb_D_flipflop is
--port();
end entity;

architecture arch of tb_D_flipflop is

component D_flipflop is
port(
	D_in: in std_logic;
	clk : in std_logic;
	Q: out std_logic
);
end component;

signal D_in : std_logic := '0';
signal clk : std_logic := '0';
signal Q: std_logic;

constant clock_period : time := 10ns;

begin

uut: D_flipflop port map(

	D_in => D_in,
	clk => clk,
	Q => Q
);

clk_proc: process 
	begin 
		clk <= '0';
		wait for clock_period/2;
		clk <= '1';
		wait for clock_period/2;
	end process;


stim_proc: process 
	begin 
        
        wait for clock_period*2;
        
		D_in <= '1' ;
		wait for 10ns;
		
		D_in <= '0';
		wait for 10ns;
		
		D_in <= '1' ;
		wait for 10ns;
		
		D_in <= '0';
		wait for 10ns;
		
		wait for clock_period*2;
		
		wait;
	end process;

end architecture;