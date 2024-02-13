library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_moore_2bit_updown_counter is 
--port();
end entity;

architecture arch of tb_moore_2bit_updown_counter is 

component moore_2bit_updown_counter is 
port(

	clk : in std_logic;
	rst : in std_logic;
	mode: in std_logic;
	Z   : out std_logic_vector(1 downto 0)
);
end component;

signal clk :  std_logic:='0';
signal rst :  std_logic:='0';
signal mode:  std_logic:='0';
signal Z   :  std_logic_vector(1 downto 0);

constant clock_period : time := 10ns;

begin

uut: moore_2bit_updown_counter port map(
	clk =>clk,
    rst =>rst,
    mode=>mode,
    Z   =>Z 
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

	wait for 20ns;
	
	rst <= '1';
	wait for 10ns;
	
	rst <= '0';
	mode <= '1';
	wait for 30ns;
	
	mode <= '0';
	wait for 30ns;
	
	wait;
end process;

end architecture;