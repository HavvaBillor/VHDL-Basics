library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity moore_101 is 
port(

	clk : in std_logic;
	rst : in std_logic;
	D_in: in std_logic;
	Z   : out std_logic
);
end entity;

architecture arch of moore_101 is 

type state is (S0,S1,S2,S3);
signal present_state , next_state : state ;

begin

clocking_proc: process (clk, rst)
begin 
	if clk = '1' and clk'event then 
		if rst = '1' then 
			present_state <= S0;
			else 
			present_state <= next_state ;
		end if;			
    end if;
end process;

input_equations: process(present_state,D_in)
begin 
	next_state <= S0;
	
	case present_state is 
		when S0 => if D_in = '0' then  next_state <= S0; 
					else next_state <= S1;
					end if;
		when S1 => if D_in = '0' then  next_state <= S2; 
					else next_state <= S1;
					end if;
		when S2 => if D_in = '0' then  next_state <= S0; 
					else next_state <= S3;
					end if;
		when S3 => if D_in = '0' then  next_state <= S2; 
					else next_state <= S1;
					end if;
		when others => next_state <= S0;
	end case;
	
end process;


output_equations : process(present_state)
begin 
	case present_state is
		when S0 => Z <= '0';
		when S1 => Z <= '0';
		when S2 => Z <= '0';
		when S3 => Z <= '1';
		when others => Z <= '0';
	end case;
end process;

end architecture;