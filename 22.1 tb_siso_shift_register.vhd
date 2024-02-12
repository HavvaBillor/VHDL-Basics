library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_siso is 
--port();
end entity;

architecture arch of tb_siso is

component siso is
port(
	clk 		: in std_logic;
	serial_in  	: in std_logic;
	serial_out 	: out std_logic
);
end component;

signal clk: std_logic;
signal serial_in: std_logic := '0';
signal serial_out: std_logic :='0';

constant clock_period : time := 10ns;

begin

uut: siso port map(
	clk 		=>clk,
    serial_in  	=>serial_in ,
    serial_out 	=>serial_out
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

		wait for clock_period*2;
		
		serial_in <= '1';
		wait for 10ns ;
		
		serial_in <= '1';
		wait for 10ns ;
		
		serial_in <= '0';
		wait for 10ns ;
		
		serial_in <= '0';
		wait for 10ns ;
		
		serial_in <= '1';
		wait for 10ns ;
		
		serial_in <= '0';
		wait for 10ns ;
		
		serial_in <= '1';
		wait for 10ns ;
		
		serial_in <= '0';
		wait for 10ns ;
		
	wait;
	end process;

end architecture;