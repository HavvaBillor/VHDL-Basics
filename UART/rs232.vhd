library ieee;
use ieee.std_logic_1164.all;

entity uart_tx is
port(clk, rst, trig: in std_logic;
data_to_send: in std_logic_vector(7 downto 0); 
tx, clk_out: out std_logic);
end entity;

architecture logic_flow of uart_tx is

type state is (idle, start_tx, st0, st1, st2, st3, st4, st5, st6, 
st7, stop);

signal present_state, next_state: state:=idle;
signal clk_9600Hz: std_logic:='0'; 
signal count: positive range 1 to 5209:=1;

begin

clk_out<=clk_9600Hz;

cdiv: process(clk, rst) -- clock divider (cdiv) 
begin 
	if(rst='1') then 
	count<=1;
	elsif(rising_edge(clk)) then
	count<=count+1;
		if(count=5209) then
		clk_9600Hz<=not clk_9600Hz;
		count<=1;
		end if;
	end if;
end process;

p1: process(clk_9600Hz, rst)
begin 
	if(rst ='1') then 
	present_state<=idle;
	elsif(rising_edge(clk_9600Hz )) then 
	present_state<=next_state;
	end if;
end process;

p2: process(present_state, trig) 
begin 
	case present_state is 
		when idle => 
		tx<='1';
			if(trig='1') then
			next_state<=start_tx; 
			else
			next_state<=idle;
			end if;
		when start_tx =>
		tx<='0';
		next_state<=st0;
		when st0 =>
		tx<=data_to_send(0); 
		next_state<=st1;
		when st1=>
		tx<=data_to_send(1); 
		next_state<=st2;
		when st2=>
		tx<=data_to_send(2); 
		next_state<=st3;
		when st3=>
		tx<=data_to_send(3); 
		next_state<=st4;
		when st4=>
		tx<=data_to_send(4); 
		next_state<=st5;
		when st5=>
		tx<=data_to_send(5); 
		next_state<=st6;
		when st6=>
		tx<=data_to_send(6); 
		next_state<=st7;
		when st7=>
		tx<=data_to_send(7); 
		next_state<=stop;
		when stop=>
		tx<='1';
			if(trig='0') then
			next_state<=idle;
			else
			next_state<=start_tx; 
			end if;
	end case;
end process;
end architecture;