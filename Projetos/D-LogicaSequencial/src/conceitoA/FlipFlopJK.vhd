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

	signal inp: std_logic_vector(1 downto 0);
	signal s0: std_logic:= '0';

begin

	inp <= J & K;

	process (clock) begin
	  	if (rising_edge(clock)) then
			case (inp) is 
				when "01" =>
					s0 <= '0';
				when "11" => 
					s0 <= not s0;
				when "10" =>
					s0 <= '1';
				when others => 
					null;
			end case;
	  	end if;
	end process;
  
	q <= s0;
	notq <= not s0;


end architecture;
