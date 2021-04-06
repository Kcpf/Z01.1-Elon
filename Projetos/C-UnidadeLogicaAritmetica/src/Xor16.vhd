-- Elementos de Sistemas
-- Xor16.vhd

-- XOR entre dois valores de 16 bits

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Xor16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Xor16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin

    q <= a xor b;

end architecture;
