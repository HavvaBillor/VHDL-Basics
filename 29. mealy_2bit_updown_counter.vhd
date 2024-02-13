library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mealy_2bit_updown_counter is 
port(

	clk : in std_logic;
	rst : in std_logic;
	mode: in std_logic;
	Z   : out std_logic_vector(1 downto 0)
);
end entity;

architecture arch of mealy_2bit_updown_counter is 

type state is (S0,S1,S2,S3);
signal present_state,next_state : state;

begin


clocking_proc: process(clk,rst)
begin 

	if clk= '1' and clk'event then
		if rst = '1' then 
			present_state <= S0;
		else 
			present_state <= next_state;
		end if;
	end if;
end process;

input_proc: process(present_state,mode)
begin 
	next_state <= S0;

	case present_state is 
		when S0 => if mode = '0' then 
						Z <= "11";
						next_state <= S3;
					else 
						Z <= "01";
						next_state <= S1;
					end if;
		when S1 => if mode = '0' then 
						Z <= "00";
						next_state <= S0;
					else 
						Z <= "10";
						next_state <= S2;
					end if;
		when S2 => if mode = '0' then 
						Z <= "01";
						next_state <= S1;
					else 
						Z <= "11";
						next_state <= S3;
					end if;
		when S3 => if mode = '0' then 
						Z <= "10";
						next_state <= S2;
					else 
						Z <= "00";
						next_state <= S0;
					end if;
		when others => next_state <= S0;
	end case;
end process;



end architecture;