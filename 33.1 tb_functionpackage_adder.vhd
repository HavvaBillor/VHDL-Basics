library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_n_bit_adder is 
--port();
end entity;

architecture arch of tb_n_bit_adder is 

component n_bit_adder_4bit is 
port(
	A,B :in bit_vector(3 downto 0);
	Cin :in bit;
	sum :out bit_vector(3 downto 0);
	Cout:out bit
);
end component;

signal A 	:bit_vector(3 downto 0):="0000";
signal B 	:bit_vector(3 downto 0):="0000";
signal Cin 	:bit :='0';
signal sum  :bit_vector(3 downto 0);
signal Cout :bit;

begin 

uut: n_bit_adder_4bit port map(
	
	A 	=>A,
	B 	=>B,
    Cin =>Cin,
    sum =>sum,
    Cout=>Cout
);

stim_proc: process
begin 

	wait for 20ns;
	
	A   <= "0100";
	B   <= "0011";
	Cin <= '0';
	wait for 10ns;
	
	A   <= "0111";
	B   <= "1011";
	Cin <= '1';
	wait for 10ns;
	
	A   <= "1110";
	B   <= "0001";
	Cin <= '1';
	wait for 10ns;
	
wait;
end process;

end architecture;
