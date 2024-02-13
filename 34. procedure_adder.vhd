library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package proced is 
procedure add (
A,B,Cin : in bit;
result : out bit_vector(1 downto 0));
end package;

package body proced is 

procedure add (
A,B,Cin : in bit;
result : out bit_vector(1 downto 0)) is 

variable sum,Cout : bit;

begin 

sum  	:= A xor B xor Cin;
Cout 	:= (A and B) or (B and Cin) or (A and Cin);
result 	:= Cout & sum;

end add;
end proced;

use work.proced.all;

entity proced_pack is 
port(
	A,B : in bit_vector(3 downto 0);
	Cin : in bit;
	sum :out bit_vector(3 downto 0);
	Cout: out bit
);
end entity;

architecture arch of proced_pack is 

begin 

	process(A,B,Cin)
	variable S0,S1,S2,S3 :bit_vector(1 downto 0);
	begin 
		
		add ( A(0), B(0),Cin,S0);
		add ( A(1), B(1),S0(1),S1);
		add ( A(2), B(2),S1(1),S2);
		add ( A(3), B(3),S2(1),S3);
		
		sum  <= S3(0) & S2(0) & S1(0) & S0(0);
		Cout <= S3(1);
	end process;
end architecture;