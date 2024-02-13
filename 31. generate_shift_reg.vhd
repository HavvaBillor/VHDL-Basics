library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity generate_shift is 
port(
	clk			:in std_logic;
	rst			:in std_logic;
	D_in_shift 	:in std_logic;
	D_out_shift :out std_logic
);
end entity;

architecture arch of generate_shift is 

component D_ff_sync is 
port(
	D_in :in std_logic;
	clk  :in std_logic;
	rst  :in std_logic;
	Q	 :out std_logic
);
end component;

constant N: integer:=4;

signal data :std_logic_vector(1 to N-1);

begin 

	first: D_ff_sync port map(
		D_in => D_in_shift,
		clk => clk,
		rst =>rst,
		Q => data(1) 
		);
		
	generate_shift : for i in 1 to N-2 generate 
	D_ff_sync_1: D_ff_sync port map(
		D_in => data(i),
		clk => clk,
		rst =>rst,
		Q => data(i+1)
	 );
	end generate;
	
	fourth: D_ff_sync port map(
		D_in => data(N-1),
		clk => clk,
		rst =>rst,
		Q => D_out_shift
	);

end architecture;