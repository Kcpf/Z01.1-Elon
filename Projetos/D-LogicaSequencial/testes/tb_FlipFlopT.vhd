-- Elementos de Sistemas
-- tb_A-FlipFlopT.vhd

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_FlipFlopT is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_FlipFlopT is

	component FlipFlopT is
    port(
      clock:  in std_logic;
      t:      in std_logic;
      q:      out std_logic:= '0';
      notq:   out std_logic:= '1'
      );
	end component;

	signal clk : std_logic := '0';
  signal t,q,notq : std_logic;

begin

	mapping: FlipFlopT port map(clk, t, q, notq);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- q <= t xor q;
		-- notq <= not q;

    -- IMPLEMENTE AQUI!
    wait until clk'event and clk='0';

    t <= '1';
    wait until clk'event and clk='0';
    assert(q = '1') report "Teste 1 falhou" severity error;

    t <= '1';
    wait until clk'event and clk='0';
    assert(q = '0') report "Teste 2 falhou" severity error;

    t <= '0';
    wait until clk'event and clk='0';
    assert(q = '0') report "Teste 3 falhou" severity error;

    -- finish
    wait until clk'event and clk='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
