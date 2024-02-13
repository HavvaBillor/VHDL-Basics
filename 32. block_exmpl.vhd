library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity block_exmpl is 
port(
	A,B,C,D : in std_logic;
	W,X,Y,Z : out std_logic
);
end entity;

architecture arch of block_exmpl is 

begin

	block1: block 
		signal sig: std_logic; -- declaration of 'sig' is in block B1
		begin 
			sig <= A or B or C ;
			
				block2: block 
					signal sig: std_logic; -- declaration of 'sig' is in block B2
					begin 
						sig <= C xor D ;
						
							block3: block 
								signal sig: std_logic; -- declaration of 'sig' is in block B3
								begin 
									sig <= A and B ;
										block4: block 
											signal sig: std_logic; -- declaration of 'sig' is in block B4
											begin 
												sig <= A and C and D ;
												Z <= sig; -- 'sig' from B4 block
											end block block4;
							Y <= sig; -- sig is from B3 block
							end block block3;
				X <= sig ; 
				end block block2;
	W <= sig ;
	end block block1;
	


 
end architecture;