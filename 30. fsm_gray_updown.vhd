library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity fsm_gray_updown is 
port(

	clk : in std_logic;
	rst : in std_logic;
	mode: in std_logic;
	Z   : out std_logic_vector(3 downto 0)
);
end entity;

architecture arch of fsm_gray_updown is 

signal state: integer range 0 to 15;

begin 

	process(clk,rst)
	begin
	
		if clk = '1' and clk'event then
			if rst = '1' then 
				state <= 0; 
				Z <= "0000";
				
			else 
				case state is
					
					when 0 => Z <= "0000";
						if mode ='1' then 
							state <= 1;
						else 
							state <= 15;
						end if;
					when 1 => Z <= "0001";
						if mode ='1' then 
							state <= 2;
						else 
							state <= 0;
						end if;
					when 2 => Z <= "0011";
						if mode ='1' then 
							state <= 3;
						else 
							state <= 1;
						end if;
					when 3 => Z <= "0010";
						if mode ='1' then 
							state <= 4;
						else 
							state <= 2;
						end if;
					when 4 => Z <= "0110";
						if mode ='1' then 
							state <= 5;
						else 
							state <= 3;
						end if;
					when 5 => Z <= "0111";
						if mode ='1' then 
							state <= 6;
						else 
							state <= 4;
						end if;
					when 6 => Z <= "0101";
						if mode ='1' then 
							state <= 7;
						else 
							state <= 5;
						end if;
					when 7 => Z <= "0100";
						if mode ='1' then 
							state <= 8;
						else 
							state <= 6;
						end if;
					when 8 => Z <= "1100";
						if mode ='1' then 
							state <= 9;
						else 
							state <= 7;
						end if;
					when 9 => Z <= "1101";
						if mode ='1' then 
							state <= 10;
						else 
							state <= 8;
						end if;
					when 10 => Z <= "1111";
						if mode ='1' then 
							state <= 11;
						else 
							state <= 9;
						end if;
					when 11 => Z <= "1110";
						if mode ='1' then 
							state <= 12;
						else 
							state <= 10;
						end if;
					when 12 => Z <= "1010";
						if mode ='1' then 
							state <= 13;
						else 
							state <= 11;
						end if;
					when 13 => Z <= "1011";
						if mode ='1' then 
							state <= 14;
						else 
							state <= 12;
						end if;
					when 14 => Z <= "1001";
						if mode ='1' then 
							state <= 15;
						else 
							state <= 13;
						end if;
					when 15 => Z <= "1000";
						if mode ='1' then 
							state <= 0;
						else 
							state <= 14;
						end if;
					when others => null;
				end case ;
			end if;
		end if;
	end process;



end architecture;