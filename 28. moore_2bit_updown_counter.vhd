library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity moore_2bit_updown_counter is 
port(

	clk : in std_logic;
	rst : in std_logic;
	mode: in std_logic;
	Z   : out std_logic_vector(1 downto 0)
);
end entity;

architecture arch of moore_2bit_updown_counter is 

type state is (S0,S1,S2,S3);
signal state_transition : state;
begin

	process (clk,rst)
	begin 
		if clk='1' and clk'event then	
			if rst = '1' then 
				state_transition <= S0; Z<= "00";
			else 
				case state_transition is
					when S0 => Z<= "00";
						if mode = '0' then 
							state_transition <= S3;
						else 
							state_transition <= S1;
						end if;
					when S1 => Z<= "01";
						if mode = '0' then 
							state_transition <= S0;
						else 
							state_transition <= S2;
						end if;
					when S2 => Z<= "10";
						if mode = '0' then 
							state_transition <= S1;
						else 
							state_transition <= S3;
						end if;
					when S3 => Z<= "11";
						if mode = '0' then 
							state_transition <= S2;
						else 
							state_transition <= S0;
						end if;
					when others => null;
				end case;
			end if;
		end if;
	end process;


end architecture;