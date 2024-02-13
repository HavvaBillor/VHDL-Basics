library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_mealy_101 is 
--port();
end entity;

architecture arch of tb_mealy_101 is 

component mealy_101 is 
port(
	clk: in std_logic;
	rst :in std_logic;
	D_in:in std_logic;
	Z 	:out std_logic
);
end component;

signal clk	:std_logic:= '0';
signal rst 	:std_logic:= '0';
signal D_in	:std_logic:= '0';
signal Z 	:std_logic;

constant clock_period : time := 10ns;

begin 

uut: mealy_101 port map(

	clk	 => clk,
    rst  => rst,
    D_in => D_in,
    Z 	 => Z
);

clock_proc: process 
begin 

	clk <= '0';
	wait for clock_period/2;
	clk <= '1';
	wait for clock_period/2;
end process;

stim_proc: process 
begin 

	wait for 10ns;
	
	rst <= '1';
	wait for 10ns;
	
	rst <= '0';
	D_in <= '1';
	wait for 10ns;
	
	D_in <= '0';
	wait for 10ns;
	D_in <= '0';
	wait for 10ns;
	D_in <= '1';
	wait for 10ns;
	D_in <= '1';
	wait for 10ns;
	D_in <= '1';
	wait for 10ns;
	D_in <= '0';
	wait for 10ns;
	D_in <= '1';
	wait for 10ns;
	D_in <= '0';
	wait for 10ns;
	D_in <= '0';
	wait for 10ns;
	
	wait;

end process;

end architecture;