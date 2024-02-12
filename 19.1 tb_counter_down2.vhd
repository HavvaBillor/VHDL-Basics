library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_counter_down2 is 
--port();
end entity;

architecture arch of tb_counter_down2 is 

component counter_down2 is 
port(
	clk : in std_logic;
	rst : in std_logic;
	Z   : out std_logic_vector(1 downto 0)
);
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal Z : std_logic_vector(1 downto 0);

constant clock_period : time := 10ns;

begin 

uut : counter_down2 port map(
	clk => clk,
	rst => rst,
	Z=>Z
);

clock_proc: process
begin 
	clk <= '0';
	wait for clock_period/2;
	clk <= '1' ;
	wait for clock_period/2;
end process;

stim_proc: process 
begin 

	rst <= '1';
	wait for 20 ns;
	
	rst <= '0';
	wait for 10ns;
	
wait;
end process;

end architecture;