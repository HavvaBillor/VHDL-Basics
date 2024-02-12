library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_pipo is 
--port();
end entity;

architecture arch of tb_pipo is 

component pipo is 
port(
	clk 		: in std_logic;
	paralel_in	: in std_logic_vector(3 downto 0);
	paralel_out : out std_logic_vector(3 downto 0)
);
end component;

signal clk 			: std_logic:='0';
signal paralel_in	: std_logic_vector(3 downto 0):="0000";
signal paralel_out  : std_logic_vector(3 downto 0);

constant clock_period : time := 10ns;

begin

uut : pipo port map(
	clk 		 =>clk,
    paralel_in	 =>paralel_in,
    paralel_out  =>paralel_out
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
		
		paralel_in <= "1000";
		wait for 10ns;
		
		paralel_in <= "1110";
		wait for 10ns;
		
		paralel_in<= "1010";
		wait for 10ns;
		
		paralel_in <= "0010";
		wait for 10ns;
		
		paralel_in <= "0100";
		wait for 10ns;
		
	wait;
	end process;

end architecture;