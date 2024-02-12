library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_sipo is 
--port();
end entity;

architecture arch of tb_sipo is

component sipo is
port(
	clk 		: in std_logic;
	serial_in  	: in std_logic;
	paralel_out : out std_logic_vector(3 downto 0)
);
end component;

signal clk 			: std_logic;
signal serial_in  	: std_logic := '0';
signal paralel_out 	: std_logic_vector(3 downto 0);

constant clock_period : time := 10ns;

begin 

uut: sipo port map(
	clk 			=> clk,
    serial_in  	=> serial_in,
    paralel_out 	=> paralel_out
);

clock_proc: process 
begin 
	clk <= '0';
	wait for clock_period/2;
	clk<= '1';
	wait for clock_period/2;
end process;

stim_proc: process 
begin 

	wait for clock_period*4;
	
	serial_in <= '1';
	wait for 10ns;
	
	serial_in <= '0';
	wait for 10ns;
	
	serial_in <= '0';
	wait for 10ns;
	
	serial_in <= '1';
	wait for 10ns;
	
	serial_in <= '1';
	wait for 10ns;
	
	serial_in <= '1';
	wait for 10ns;
	
	serial_in <= '0';
	wait for 10ns;
	
	serial_in <= '1';
	wait for 10ns;

	wait;
end process;

end architecture;