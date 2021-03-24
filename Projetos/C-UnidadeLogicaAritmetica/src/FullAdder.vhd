-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin
<<<<<<< HEAD
  soma <= a xor b xor c;
  vaium <= (a and b) or (c and (a xor b));

=======
  -- Implementação vem aqui!
  soma <= a xor b xor c;
  vaium <= (a and b) or (c and (a xor b));
>>>>>>> 0c675ccf355e2c8c18fe25ee4847eb1a921fd42c
end architecture;
