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
entity ConceitoB is
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
architecture rtl of ConceitoB is


component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end component;

--------------
-- signals
--------------
signal suporte1 : std_logic_vector(3 downto 0);
signal suporte2 : std_logic_vector(3 downto 0);
signal suporte3 : std_logic_vector(3 downto 0);

---------------
-- implementacao
---------------
begin

	suporte1 <= SW(3 downto 0);
	suporte2 <= SW(7 downto 4);
	suporte3 <= "00" & SW(9 downto 8);
	
	u1: sevenSeg port map(
		bcd => suporte1,
		leds => HEX2
	);
	
	u2: sevenSeg port map(
		bcd => suporte2,
		leds => HEX1
	);
	
	u3: sevenSeg port map(
		bcd => suporte3,
		leds => HEX0
	);


end rtl;
