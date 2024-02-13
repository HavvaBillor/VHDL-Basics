library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity integrated is 
port(
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	Y : out std_logic
);
end entity;

architecture arch of integrated is 

signal T: std_logic_vector(3 downto 0);

component gate_xnor is 
port(
	P,Q :in std_logic;
	R : out std_logic
);
end component;

component gate_and is 
port(
	D,E,F,G :in std_logic;
	H      : out std_logic
);
end component;

begin

U1: gate_xnor port map( P=> A(0), Q=> B(0),R=>T(0));
U2: gate_xnor port map( P=> A(1), Q=> B(1),R=>T(1));
U3: gate_xnor port map( P=> A(2), Q=> B(2),R=>T(2));
U4: gate_xnor port map( P=> A(3), Q=> B(3),R=>T(3));

U5: gate_and port map(D=>T(0),E=>T(1),F=>T(2),G=>T(3),H=>Y);


end architecture;