library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package n_bit_adder is 
	function add (A,B,Cin : in bit) return bit_vector;
end package;

package body n_bit_adder is 

	function add (A,B,Cin : in bit) return bit_vector is 
		variable sum,Cout : bit;
		variable result: bit_vector(1 downto 0);
	begin 
		sum 	:= A xor B xor Cin;
		Cout	:= (A and B) or (B and Cin) or (A and Cin);
		result 	:= Cout & sum ;
		
	return result;
	end add;
end n_bit_adder;
	
use work.n_bit_adder.all;

entity n_bit_adder_4bit is 
port(
	A,B :in bit_vector(3 downto 0);
	Cin :in bit;
	sum :out bit_vector(3 downto 0);
	Cout:out bit
);
end entity;

architecture arch of n_bit_adder_4bit is 

signal S0,S1,S2,S3: bit_vector(1 downto 0);

begin 

	S0 <= add (A(0),B(0),Cin);
	S1 <= add (A(1),B(1),S0(1));
	S2 <= add (A(2),B(2),S1(1));
	S3 <= add (A(3),B(3),S2(1));
	
	sum  <= S3(0) & S2(0) & S1(0) & S0(0);
	Cout <= S3(1);
	
end architecture;