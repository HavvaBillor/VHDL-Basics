library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_count_updown4 is 
--port();
end entity;

architecture arch of tb_count_updown4 is 

component count_updown4 is
port(
	clk : in std_logic;
	rst : in std_logic;
	Z 	: out std_logic_vector(3 downto 0);
	mode: in std_logic                     
);
end component;

signal clk :std_logic:= '0';
signal rst :std_logic:= '0';
signal Z   :std_logic_vector(3 downto 0);
signal mode:std_logic:= '0';                     

constant clock_period : time := 10ns;

begin 

uut : count_updown4 port map(

	clk =>clk,
	rst =>rst,
    Z   =>Z,
    mode=>mode
);

clock_proc : process 
begin 

	clk <= '0';
	wait for clock_period/2;
	clk <= '1';
	wait for clock_period/2;
end process;

stim_proc : process 
	begin 
		
		wait for clock_period*2;
		
		rst <= '1';
		wait for clock_period*4;
		
		rst <= '0';
		mode <= '1';
		wait for 10ns;
		
		rst <= '0';
		mode <= '1';
		wait for 10 ns;
		
		rst <= '0';
		mode <= '1';
		wait for 10 ns;
		
		rst <= '0';
		mode <= '1';
		wait for 10 ns;
		
		
		rst <= '0';
		mode <= '0';
		wait for 10 ns;
		
		rst <= '0';
		mode <= '0';
		wait for 10 ns;
		
		rst <= '0';
		mode <= '0';
		wait for 10 ns;
		
	end process;

end architecture;