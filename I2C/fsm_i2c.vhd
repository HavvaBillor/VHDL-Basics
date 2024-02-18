library ieee;
use ieee.std_logic_1164.all;

entity fsm_i2c  is
port(clk_100MHz, rst, wr_enable:  in std_logic;
scl, dcl: out  std_logic;
sda: inout std_logic);
end entity;

architecture logic_flow of  fsm_i2c  is

type state is (st_idle, st0_start, st1_txSlaveAddress, st2_ack0, 
st3_txData,  st4_ack1,  st5_stop);

signal present_state, next_state: state;
signal scl_buss: std_logic:='0';
signal dcl_buss: std_logic:='0';
constant data: std_logic_vector(7 downto 0):="11101100"; 

constant slave_address_with_wrt_flg:
std_logic_vector(7downto 0):="11101100";  
     
constant max_length: natural:=8;

signal data_index: natural range 0 to max_length -1;
signal timer: natural range 0 to max_length;
signal ack_bits: std_logic_vector(1 downto 0);
signal count: natural range 0 to 11:=0;
signal clk_4MHz: std_logic:='0';

begin

dcl<=dcl_buss;

clk4MHz: process(clk_100MHz)
begin
	if(rising_edge(clk_100MHz)) then
	count<=count + 1;
	if(count=12) then
	clk_4MHz<=not clk_4MHz;
	count<=0;
	end if;
	end if;
end process;

clk1MHz: process (clk_4MHz)
variable count_1: integer range 0 to 3:=0; 
begin
	if(rising_edge(clk_4MHz)) then
		if(count_1=0) then
		scl_buss<='0';
		elsif(count_1=1) then
		dcl_buss<='1';
		elsif(count_1=2) then
		scl_buss<='1';
		else
		dcl_buss<='0';
		end if;
		if(count_1=3) then
		count_1:=0;
		else
		count_1:=count_1 + 1;
		end if;
	end if;
end process;

p1: process(dcl_buss, rst)
begin
	if(rst ='1') then
	present_state<=st_idle;
	data_index<=0;
	elsif (dcl_buss'event and dcl_buss='1') then 
		if(data_index=timer-1) then
		present_state<=next_state;
		data_index<=0;
		else
		data_index<=data_index +1;
		end if; 
	end if;
end process;

p2: process(dcl_buss)
begin
	if(dcl_buss'event and dcl_buss='1') then 
		if(present_state=st2_ack0) then
		ack_bits(0)<=sda;
		elsif( present_state=st4_ack1) then 
		ack_bits(1)<=sda;        
		end if;
	end if;
end process;

p3: process(present_state, wr_enable, data_index, dcl_buss) 
begin

	case present_state is
		when st_idle =>
		scl<='1';
		sda<='1';
		timer<=1;
			if(wr_enable='1') then
			next_state<=st0_start;
			else
			next_state<=st_idle;
			end if;      
		when st0_start =>
		sda<=dcl_buss;
		timer<=1;
		next_state<=st1_txSlaveAddress;
		scl<='1';
		when st1_txSlaveAddress =>
		sda<=slave_address_with_wrt_flg(7-data_index); 
		timer<=8;
		next_state<=st2_ack0; 
		scl<=scl_buss;
		when st2_ack0=>
		sda<='Z';
		timer<=1;
		next_state<=st3_txData; 
		scl<=scl_buss;          
		when st3_txData =>
		sda<=data(7-data_index);
		timer<=8;
		next_state<=st4_ack1; 
		scl<=scl_buss;
		when st4_ack1=>
		sda<='Z';
		timer<=1;
		next_state<=st5_stop; 
		scl<=scl_buss;
		when st5_stop =>
		sda<=not dcl_buss;
		timer<=1;
		next_state<=st_idle; 
		scl<='1';
	end case;
end process;

end architecture;