library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mealy_101 is 
port(
	clk: in std_logic;
	rst :in std_logic;
	D_in: in std_logic;
	Z :out std_logic
);
end entity;

architecture arch of mealy_101 is

type state is (S0,S1,S2) ;
signal present_state: state ;

begin 

clocking_proc: process(clk,rst)
begin 

	if clk = '1' and clk'event then 
		if rst = '1' then
			present_state <= S0;
		else 
			case present_state is 
				when S0 => if D_in = '0' then 
								Z <= '0';
								present_state <= S0;
							else 
								Z <= '0';
								present_state <= S1;
							end if;
				when S1 => if D_in = '0' then 
								Z <= '0';
								present_state <= S2;
							else 
								Z <= '0';
								present_state <= S1;
							end if;
				when S2 => if D_in = '0' then 
								Z <= '0';
								present_state <= S0;
							else 
								Z <= '1';
								present_state <= S1;
							end if;
				when others => present_state<= S0;
			end case;
		end if;
	end if;

end process;

end architecture;