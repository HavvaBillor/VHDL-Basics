library ieee;
use ieee.std_logic_1164.all;

entity tb_combinational is 
-- port();
end entity;

architecture arch of tb_combinational is 

component combinational is 
	port(

		A				: in std_logic; 						-- 1st data input 2:1 mux
		B				: in std_logic; 						--2nd data input 2:1 mux
		S				: in std_logic;							-- select of 2:1 mux 
		MUX2			: out std_logic; 						-- output of 2:1 mux		
		C 				: in std_logic;         				--1st data input 4:1 mux
		D 				: in std_logic;         				--2nt data input 4:1 mux
		E				: in std_logic;         				--3rd data input 4:1 mux
		F 				: in std_logic;         				--4th data input 4:1 mux
		SEL 			: in std_logic_vector(1 downto 0); 		-- select of 4:1 mux
		MUX4			: out std_logic; 						-- output of 4:1 mux		
		EnIn			: in std_logic_vector(3 downto 0); 		-- 4 bit in data of encoder 4x2
		EnOUT			: out std_logic_vector(1 downto 0); 	-- 2 bit out data of encoder 4x2		
		DecdIN			: in std_logic_vector(1 downto 0);  	-- 2 bit in data of decoder 2x4
		DecdOUT			: out std_logic_vector(3 downto 0) 	-- 4 bit out data of decoder 2x4
	);
end component;

signal A				:std_logic; 					
signal B				:std_logic; 					
signal S				:std_logic;						
signal MUX2				:std_logic; 					
signal C 				:std_logic;         			
signal D 				:std_logic;         			
signal E				:std_logic;         			
signal F 				:std_logic;         			
signal SEL 				:std_logic_vector(1 downto 0); 
signal MUX4				:std_logic; 					
signal EnIn				:std_logic_vector(3 downto 0); 
signal EnOUT			:std_logic_vector(1 downto 0);
signal DecdIN			:std_logic_vector(1 downto 0); 
signal DecdOUT			:std_logic_vector(3 downto 0);

begin 

uut: combinational port map 
(

	 A	     =>  A,	
     B	     =>  B,	
     S	     =>  S,	
     MUX2	 =>  MUX2,	
     C 	     =>  C,	
     D 	     =>  D, 	
     E	     =>  E,	
     F 	     =>  F,	
     SEL 	 =>  SEL, 	
     MUX4	 =>  MUX4,	
     EnIn	 =>  EnIn,	
     EnOUT   =>  EnOUT,
     DecdIN  =>  DecdIN,
     DecdOUT =>  DecdOUT
	 
);

stim_proc: process 
begin 

	A <= '0';
	B <= '1';
	S <= '0';
	
	C<= '0';
	D <= '1';
	E <= '0';
	F <= '1';
	SEL <= "00";
	
	EnIn <= "0001";
	DecdIN <= "00";
	wait for 10ns;
	
	S <= '1';
	SEL <= "01";
	EnIn <= "0010";
	DecdIN <= "01";
	wait for 10ns;
	
	S <= '0';
	SEL <= "10";
	EnIn <= "0100";
	DecdIN <= "10";
	wait for 10ns;
	
	S <= '1';
	SEL <= "11";
	EnIn <= "1000";
	DecdIN <= "11";
	wait for 10ns;
	
	wait ;

end process;


end architecture;