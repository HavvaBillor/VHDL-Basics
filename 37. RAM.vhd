library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity RAM is
port(
	DataRAMin 		: in std_logic_vector(7 downto 0);
	DataRAMout 		:out std_logic_vector(7 downto 0);
	MuxAddr			:in std_logic_vector(3 downto 0);
	read_or_write	:in std_logic;
	clk 			: in std_logic
);
end entity;

architecture arch of RAM is 

	type din is array (15 downto 0) of std_logic_vector(7 downto 0);
	signal datain : din;

begin 

	process(clk)
	begin 
		if clk='1' and clk'event then 
			case read_or_write is 
			
				when '0' => -- write inte ram memory --mode
					datain(conv_integer(MuxAddr)) <= DataRAMin;
				when '1' => --read from ram memory --mode 
					DataRAMout <= datain(conv_integer(MuxAddr));
				when others => null;
			end case;
		end if;
	end process;
	
end architecture;