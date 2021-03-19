----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity ConceitoA is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(9 downto 0);
        HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		LEDR     : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of ConceitoA is


component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end component;

-- --------------
-- -- signals
-- --------------
signal suporte1 : std_logic_vector(3 downto 0);
signal suporte2 : std_logic_vector(3 downto 0);
signal suporte3 : std_logic_vector(3 downto 0);
---------------
-- implementacao
---------------
begin

binbcd : ENTITY work.binarioToBcd port map(
	clk => CLOCK_50, 
	reset=> '0',
	binary_in => SW,
	bcd0 => suporte1,
	bcd1 => suporte2,
	bcd2 => suporte3,
	bcd3  => open,
	bcd4  => open);

u1: sevenSeg port map(
	bcd => suporte1,
	leds => HEX0
);

u2: sevenSeg port map(
	bcd => suporte2,
	leds => HEX1
);

u3: sevenSeg port map(
	bcd => suporte3,
	leds => HEX2
);

end rtl;
