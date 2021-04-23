-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is

	signal q1: std_logic:= '0';

begin

	process (clock) begin
		if (rising_edge(clock)) then
		  if t = '1' then
			q1 <= not q1;
		  end if;
		end if;
	end process;
	
	q <= q1;
	notq <= not q1;

end architecture;
