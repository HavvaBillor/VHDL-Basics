library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_project_integrated is 
--port();
end entity;

architecture arch of tb_project_integrated is

component integrated is 
port(
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	Y : out std_logic                   
);
end component;

signal A :std_logic_vector(3 downto 0):=(others=>'0');
signal B :std_logic_vector(3 downto 0):=(others=>'0');
signal Y :std_logic;                  

begin 

uut: integrated port map(
	A =>A,
    B =>B,
    Y =>Y
);

stim_proc: process 
			begin 

				wait for 10ns;
				
				A <= "0011";
				B <= "1010";
				wait for 10ns;
				
				A <= "1111";
				B <= "1010";
				wait for 10ns;
				
				A <= "0011";
				B <= "1110";
				wait for 10ns;
				
				A <= "0001";
				B <= "1000";
				wait for 10ns;
				
				A <= "0101";
				B <= "0110";
				wait for 10ns;
				
			wait;
			end process;

end architecture;