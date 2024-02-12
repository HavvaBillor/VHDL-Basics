library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity D_ff_sync is 
port(
	D_in :in std_logic;
	clk  :in std_logic;
	rst  :in std_logic;
	Q	 :out std_logic
);
end entity;

architecture arch of D_ff_sync is
begin 
	
	process(rst,clk)
	begin 
		if clk = '1' and clk'event then
			if rst = '1' then 
				Q <= 'Z';
			else 
				Q <= D_in;
			end if;
		end if;
	end process;

end architecture;