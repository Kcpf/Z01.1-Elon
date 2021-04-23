-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is

begin

	process(clock, J, Q) begin
		if(rising_edge(clock)) then
			q <= (J and notq) or (not K and q);
			notq <= not q;
		end if;
	end process;

end architecture;
