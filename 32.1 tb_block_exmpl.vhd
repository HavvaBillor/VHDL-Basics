library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_block_exmpl is 
--port();
end entity;

architecture arch of tb_block_exmpl is 

component block_exmpl is 
port(
	A,B,C,D : in std_logic;
	W,X,Y,Z : out std_logic
);
end component;

signal A,B,C,D : std_logic:='0'; 
signal W,X,Y,Z : std_logic;

begin 

uut: block_exmpl port map(

	A=> A,
	B=> B,
	C=> C,
	D=> D,
	W=> W,
	X=> X,
	Y=> Y,
	Z=> Z
);


stim_proc: process 
begin 
	
	wait for 20ns;

	A<='0';
	B<='1';
	C<='1';
	D<='0';
	wait for 10ns;
	
	A<='1';
	B<='0';
	C<='1';
	D<='0';
	wait for 10ns;
	
	A<='1';
	B<='1';
	C<='1';
	D<='1';
	wait for 10ns;
	
	A<='0';
	B<='1';
	C<='0';
	D<='0';
	wait for 10ns;

	wait;
end process;


end architecture;