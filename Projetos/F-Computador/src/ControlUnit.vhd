-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                  -- A  e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

begin

  loadD <= instruction(17) and instruction(4);
  loadM <= instruction(17) and instruction(5);
  loadA <= not instruction(17) or instruction(3);
  
  muxALUI_A <= not instruction(17);
  muxAM <= instruction(13) and instruction(17);
  
  zx <= instruction(12) and instruction(17);
  nx <= instruction(11) and instruction(17);
  zy <= instruction(10) and instruction(17);
  ny <= instruction(9) and instruction(17);
  f <= instruction(8) and instruction(17);
  no <= instruction(7) and instruction(17);
  
  loadPC <= '1' when (instruction(17) = '1' and instruction(2 downto 0) = "001") and (ng = '0' and zr = '0') else
            '1' when (instruction(17) = '1' and instruction(2 downto 0) = "010") and (ng = '0' and zr = '1') else
            '1' when (instruction(17) = '1' and instruction(2 downto 0) = "011") and (ng = '0') else
            '1' when (instruction(17) = '1' and instruction(2 downto 0) = "100") and (ng = '1' and zr = '0') else
            '1' when (instruction(17) = '1' and instruction(2 downto 0) = "101") and (zr = '0') else
            '1' when (instruction(17) = '1' and instruction(2 downto 0) = "110") and (ng = '1' or zr = '1') else
            '1' when (instruction(17) = '1' and instruction(2 downto 0) = "111") else
            '0';

end architecture;
