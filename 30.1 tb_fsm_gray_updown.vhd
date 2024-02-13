library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_fsm_gray_updown is 
--port();
end entity;

architecture arch of tb_fsm_gray_updown is 

component fsm_gray_updown is 
port(

	clk : in std_logic;
	rst : in std_logic;
	mode: in std_logic;
	Z   : out std_logic_vector(3 downto 0)
);
end component;

signal clk : std_logic:='0';
signal rst : std_logic:='0';
signal mode: std_logic:='0';
signal Z   : std_logic_vector(3 downto 0);

constant clock_period : time := 10ns;

begin

	uut: fsm_gray_updown port map(
									clk =>clk,
									rst =>rst,
									mode=>mode,
									Z   =>Z
								);

	clock_proc : process 
					begin 
						clk <= '0';
						wait for clock_period/2;
						clk <= '1';
						wait for clock_period/2;
					end process;

	stim_proc: process 
			begin 

				wait for clock_period*2;
					
				rst <= '1';
				wait for 10ns;
					
				rst <= '0';
				mode <= '1';
				wait for 10ns;
					
				mode <= '1';
				wait for 40ns;
					
				mode <= '1';
				wait for 50ns;

				wait;
			end process;


end architecture;