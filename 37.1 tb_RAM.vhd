library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_RAM is
--port();
end entity;

architecture arch of tb_RAM is 

component RAM is
port(
	DataRAMin 		:in std_logic_vector(7 downto 0);
	DataRAMout 		:out std_logic_vector(7 downto 0);
	MuxAddr			:in std_logic_vector(3 downto 0);
	read_or_write	:in std_logic;
	clk 			:in std_logic                      
);
end component;

signal DataRAMin 	:std_logic_vector(7 downto 0):=(others => '0');
signal DataRAMout 	:std_logic_vector(7 downto 0);
signal MuxAddr		:std_logic_vector(3 downto 0):=(others => '0');
signal read_or_write:std_logic := '0';
signal clk 			:std_logic := '0';                     

constant clock_period : time := 10ns;

begin

uut: RAM port map(
	DataRAMin 	 =>DataRAMin,
	DataRAMout 	 =>DataRAMout,
    MuxAddr		 =>MuxAddr,
    read_or_write=>read_or_write,
    clk 		 =>clk
);

clock_proc: process 
begin 
	clk <= '0';
	wait for clock_period/2;
	clk <= '1';
	wait for clock_period/2;
end process;

stim_proc: process 
begin 
	wait for 10ns;
		
	read_or_write <= '0'; --write mode 
	MuxAddr       <= "0000";
	DataRAMin     <= "00000001";
	wait for 10ns;
	MuxAddr       <= "0001";
	DataRAMin     <= "00000011";
	wait for 10ns;
	MuxAddr       <= "0010";
	DataRAMin     <= "00000111";
	wait for 10ns;
	MuxAddr       <= "0011";
	DataRAMin     <= "00010001";
	wait for 10ns;
	MuxAddr       <= "0100";
	DataRAMin     <= "01000001";
	wait for 10ns;
	MuxAddr       <= "0101";
	DataRAMin     <= "00110001";
	wait for 10ns;
	MuxAddr       <= "0110";
	DataRAMin     <= "00000001";
	wait for 10ns;
	MuxAddr       <= "0111";
	DataRAMin     <= "01001100";
	wait for 10ns;
	MuxAddr       <= "1000";
	DataRAMin     <= "00100001";
	wait for 10ns;
	MuxAddr       <= "1001";
	DataRAMin     <= "00000001";
	wait for 10ns;
	MuxAddr       <= "1010";
	DataRAMin     <= "10000001";
	wait for 10ns;
	MuxAddr       <= "1011";
	DataRAMin     <= "00000001";
	wait for 10ns;
	MuxAddr       <= "1100";
	DataRAMin     <= "00001111";
	wait for 10ns;
	MuxAddr       <= "1101";
	DataRAMin     <= "01100001";
	wait for 10ns;
	MuxAddr       <= "1110";
	DataRAMin     <= "01011001";
	wait for 10ns;
	MuxAddr       <= "1111";
	DataRAMin     <= "01000011";
	wait for 10ns;
	
	read_or_write <= '1'; --read mode
	MuxAddr       <= "0000";
	wait for 10ns;
	MuxAddr       <= "0001";
	wait for 10ns;
	MuxAddr       <= "0010";
	wait for 10ns;
	MuxAddr       <= "0011";
	wait for 10ns;
	MuxAddr       <= "0100";
	wait for 10ns;
	MuxAddr       <= "0101";
	wait for 10ns;
	MuxAddr       <= "0110";
	wait for 10ns;
	MuxAddr       <= "0111";
	wait for 10ns;
	MuxAddr       <= "1000";
	wait for 10ns;
	MuxAddr       <= "1001";
	wait for 10ns;
	MuxAddr       <= "1010";
	wait for 10ns;
	MuxAddr       <= "1011";
	wait for 10ns;
	MuxAddr       <= "1100";
	wait for 10ns;
	MuxAddr       <= "1101";
	wait for 10ns;
	MuxAddr       <= "1110";
	wait for 10ns;
	MuxAddr       <= "1111";

wait;
end process;
 
end architecture;

