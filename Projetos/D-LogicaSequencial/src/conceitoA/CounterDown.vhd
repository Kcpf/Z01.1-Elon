-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is

	component FlipFlopT is
		port(
			clock:  in std_logic;
			t:      in std_logic;
			q:      out std_logic;
			notq:   out std_logic
		);
	end component;

	signal q0, q1 : std_logic;

begin

	flipflop0 : FlipFlopT port map (
		clock => clock,
		t => '1',
		q => q0,
		notq => open
	);

	q(0) <= q0;

	flipflop1 : FlipFlopT port map (
		clock => q0,
		t => '1',
		q => q1,
		notq => open
	);

	q(1) <= q1;

	flipflop2 : FlipFlopT port map (
		clock => q1,
		t => '1',
		q => q(2),
		notq => open
	);


end architecture;
