library ieee;
use ieee.std_logic_1164.all;

entity fsm_i2c_tb is
end;

architecture bench of fsm_i2c_tb is

component fsm_i2c
port(clk_100MHz, rst, wr_enable:  in std_logic; 
scl, dcl: out  std_logic;
sda: inout std_logic);
end component;

signal clk_100MHz, rst, wr_enable: std_logic; 
signal scl, dcl: std_logic;
signal sda: std_logic;

constant clock_period: time:= 10 ns;

signal stop_the_clock: boolean;

begin

pm: fsm_i2c port map(clk_100MHz => clk_100MHz,
rst        => rst,
wr_enable  => wr_enable,
scl        => scl,
dcl        => dcl,
sda        => sda ); 

p1: process --stimulus  
begin 
	rst<='1'; rst<='0'; 
	wait for clock_period*100;
	wr_enable<='0'; wr_enable<='1';   
	wait for clock_period*22*100;    
	wr_enable<='0';
	stop_the_clock<=true;
	wait;
end process;

p2: process --clock generation
begin
	while not stop_the_clock loop
	clk_100MHz<= '0';
	wait for clock_period / 2;
	clk_100MHz<= '1';    
	wait for clock_period / 2;  
	end loop;
	wait;
end process;

end architecture;