library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_gray_updown is 
--port();
end entity;

architecture arch of tb_gray_updown is

component gray_updown is
port(
	clk : in std_logic;
	rst : in std_logic;
	Z 	: out std_logic_vector(3 downto 0);
	mode: in std_logic                      
);
end component;

signal clk 	: std_logic;
signal rst 	: std_logic;
signal Z 	: std_logic_vector(3 downto 0);
signal mode	: std_logic;

constant clock_period : time := 10ns;                     

begin

uut: gray_updown port map(
	clk 	=>clk,
    rst 	=>rst,
    Z 		=>Z, 
    mode	=>mode
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
			wait for clock_period*2;
		
			rst <= '1';
			wait for clock_period*4;
			
			rst <= '0';
			mode <= '1';
			wait for 50ns;
			
			mode <= '0';
			wait for 50 ns;
			wait;
	end process;
end architecture;