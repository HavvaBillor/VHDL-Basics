library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_generate_shift is 
--port();
end entity;

architecture arch of tb_generate_shift is 

component generate_shift is 
port(
	clk			:in std_logic;
	rst			:in std_logic;
	D_in_shift 	:in std_logic;
	D_out_shift :out std_logic
);
end component;

signal clk			:std_logic:='0';
signal rst			:std_logic:='0';
signal D_in_shift 	:std_logic:='0';
signal D_out_shift 	:std_logic;

constant clock_period : time := 10ns;

begin 

uut: generate_shift port map(
	clk			=>clk,
    rst			=>rst,
    D_in_shift 	=>D_in_shift,
    D_out_shift =>D_out_shift
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
	wait for 10ns;
	
	rst <= '0';
	D_in_shift <= '0';
	wait for 10ns;
	D_in_shift <= '1';
	wait for 10ns;
	D_in_shift <= '1';
	wait for 10ns;
	D_in_shift <= '0';
	wait for 10ns;
	D_in_shift <= '1';
	wait for 10ns;
	D_in_shift <= '0';
	wait for 10ns;
	D_in_shift <= '1';
	wait for 10ns;
	
	wait;
end process;


end architecture;