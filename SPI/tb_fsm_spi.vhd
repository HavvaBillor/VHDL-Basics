library ieee;
use ieee.std_logic_1164.all;

entity spi_Example_TB is
end entity;

architecture logic_flow of spi_Example_TB is 

component fsm_spi
port(clk, rst, tx_enable: in std_logic;
mosi, ss, sclk: out std_logic );
end component;

signal clk1, rst1, tx_enable1: std_logic:='0'; 
signal mosi1, ss1, sclk1: std_logic:='0'; 

constant clock_period: time :=10 ns; 

signal stop_the_clock: boolean;

begin

pm: fsm_spi port map(
	clk=>clk1,
	rst=>rst1,  
	tx_enable=>tx_enable1, 
	mosi=>mosi1,
	ss=>ss1,
	sclk=>sclk1);

ps: process
begin
	rst1<='1';
	wait for clock_period; 
	rst1<='0';
	tx_enable1<='1';
	wait for clock_period; 
	wait for clock_period*8; 
	stop_the_clock<=true;
	wait;
end process;

pc: process --clock generations 
begin
	while not stop_the_clock loop 
	clk1<='0';
	wait for clock_period / 2; 
	clk1<='1';    
	wait for clock_period / 2;  
	end loop;
	wait;
end process;

end architecture;