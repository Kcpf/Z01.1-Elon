-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

    signal muxOut : std_logic_vector(15 downto 0);

    component Inc16 is
        port(
            a   :  in STD_LOGIC_VECTOR(15 downto 0);
            q   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component Register16 is
        port(
            clock:   in STD_LOGIC;
            input:   in STD_LOGIC_VECTOR(15 downto 0);
            load:    in STD_LOGIC;
            output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component Mux16 is
        port (
            a: in STD_LOGIC_VECTOR(15 downto 0);
            b: in STD_LOGIC_VECTOR(15 downto 0);
            sel: in STD_LOGIC;
            q: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal incout: STD_LOGIC_VECTOR(15 downto 0);
    signal q0: STD_LOGIC_VECTOR(15 downto 0);
    signal q1: STD_LOGIC_VECTOR(15 downto 0);
    signal q2: STD_LOGIC_VECTOR(15 downto 0);
    signal regout: STD_LOGIC_VECTOR(15 downto 0);

begin
        
    registerComponent: Register16 port map (
        clock => clock,
        input => q2, 
        load => '1', 
        output => regout
    );

    incrementComponent: Inc16 port map (
        a => regout,
        q => incout
    );

	muxComponent0: Mux16 port map (
        a => regout,
        b => incout, 
        sel=> increment,
        q => q0
    );

	muxComponent1: Mux16 port map (
        a => q0,
        b => input,
        sel => load,
        q => q1
    );

    muxComponent2: Mux16 port map (
        a => q1,
        b => "0000000000000000",
        sel => reset,
        q => q2
    );

	output <= regout; 	

end architecture;
