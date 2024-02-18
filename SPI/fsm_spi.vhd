library ieee;
use ieee.std_logic_1164.all;

entity fsm_spi is
port(clk, rst, tx_enable:  in std_logic;
mosi, ss, sclk: out std_logic );
end entity;

architecture logic_flow of fsm_spi  is

type state is (st_idle, st_txBit7, st_txBit6, st_txBit5,
st_txBit4, st_txBit3,st_txBit2,st_txBit1,st_txBit0); 

signal present_state, next_state: state;
constant data: std_logic_vector(7 downto 0):="11010110"; 

signal spi_sclk: std_logic;


begin
spi_sclk<=clk; 
sclk<=spi_sclk;

p1: process(spi_sclk, rst) -- The next state logic 
begin
	if(rst='1' or (tx_enable ='0')) then
	present_state<= st_idle;
	elsif (spi_sclk'event and spi_sclk='0') then 
	present_state<=next_state;    
	end if;   
end process; 


p2: process(present_state, tx_enable) 
begin
	case present_state is
		when st_idle =>
			ss<='1'; sclk<='0'; mosi<='X';
			if(tx_enable ='1') then
			next_state<= st_txBit7;
			else
			next_state<= st_idle;
			end if;
		when st_txBit7=>
		ss<='0';
		mosi<= data(7);
		next_state<= st_txBit6;
		when st_txBit6=>
		ss<='0';
		mosi<= data(6);
		next_state<= st_txBit5;
		when st_txBit5=>
		ss<='0';
		mosi<= data(5);
		next_state<= st_txBit4;
		when st_txBit4=>
		ss<='0';
		mosi<= data(4);
		next_state<= st_txBit3;
		when st_txBit3=>
		ss<='0';
		mosi<= data(3);
		next_state<= st_txBit2;
		when st_txBit2=>
		ss<='0';
		mosi<= data(2);
		next_state<= st_txBit1; 
		when st_txBit1=>
		ss<='0';
		mosi<= data(1);
		next_state<= st_txBit0; 
		when st_txBit0=>
		ss<='0';
		mosi<= data(0);
		next_state<= st_idle;  
	end case;
end process;

end architecture;