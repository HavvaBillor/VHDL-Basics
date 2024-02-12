library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_piso is 
--port();
end entity;

architecture arch of tb_piso is

component piso is
port(
	clk 		: in std_logic;
	load		: in std_logic;
	serial_out  : out std_logic;
	paralel_in 	: in std_logic_vector(3 downto 0)
);
end component;

signal clk 			: std_logic;
signal serial_out  	: std_logic := '0';
signal load 		: std_logic :='0';
signal paralel_in 	: std_logic_vector(3 downto 0);

constant clock_period : time := 10ns;

begin 

uut: piso port map(
	clk 			=> clk,
	load 			=>load,
    serial_out  	=> serial_out,
    paralel_in  	=> paralel_in
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
	
	load <= '1';
	paralel_in <= "1010";
	wait for 10ns;
	
	load <= '0';
	wait for 10ns;
	
	load <= '1';
	paralel_in <= "1001";
	wait for 10ns;
	
	load <= '0';
	wait for 10ns;
	
	load <= '1';
	paralel_in <= "0110";
	wait for 10ns;
	
	load <= '0';
	wait for 10ns;
	
	load <= '1';
	paralel_in <= "0111";
	wait for 10ns;
	
	load <= '0';
	wait for 10ns;
	
	wait for 100ns;
end process;

end architecture;