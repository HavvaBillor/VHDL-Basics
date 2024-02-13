library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_ROM is 
--port();
end entity;

architecture arch of tb_ROM is 

component ROM is
port(

	d_out	:out std_logic_vector(7 downto 0);
	address :in std_logic_vector(3 downto 0);
	clk 	:in std_logic;
	rd 		:in std_logic                      
);
end component;

signal d_out	:std_logic_vector(7 downto 0);
signal address 	:std_logic_vector(3 downto 0):= (others => '0');
signal clk 		:std_logic := '0';
signal rd 		:std_logic := '0';                     

constant clock_period : time := 10ns;

begin

uut: ROM port map(
	d_out	=>d_out,
    address =>address,
    clk 	=>clk,
    rd 		=>rd
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
	
	rd		<= '1';
	address	<="0000";
	wait for 10ns;
	rd		<= '1';
	address	<="0001";
	wait for 10ns;
	rd		<= '1';
	address	<="0010";
	wait for 10ns;
	rd		<= '1';
	address	<="0011";
	wait for 10ns;
	rd		<= '1';
	address	<="0100";
	wait for 10ns;
	rd		<= '1';
	address	<="0101";
	wait for 10ns;
	rd		<= '1';
	address	<="0110";
	wait for 10ns;
	rd		<= '1';
	address	<="0111";
	wait for 10ns;
	rd		<= '1';
	address	<="1000";
	wait for 10ns;
	rd		<= '1';
	address	<="1001";
	wait for 10ns;
	rd		<= '1';
	address	<="1010";
	wait for 10ns;
	rd		<= '1';
	address	<="1011";
	wait for 10ns;
	rd		<= '1';
	address	<="1100";
	wait for 10ns;
	rd		<= '1';
	address	<="1101";
	wait for 10ns;
	rd		<= '1';
	address	<="1110";
	wait for 10ns;
	rd		<= '1';
	address	<="1111";
	wait for 10ns;

wait;
end process;



 
end architecture;