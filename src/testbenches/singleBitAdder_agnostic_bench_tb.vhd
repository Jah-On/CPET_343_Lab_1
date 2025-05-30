/*

Author: John Schulz
Created: 29/05/2025

Test bench for single bit adder. Compatible with both behavioral and 
    structural implementation.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity singleBitAdder_agnostic_bench is
end entity singleBitAdder_agnostic_bench;

architecture testing of singleBitAdder_agnostic_bench is
    component singleBitAdder is
        port (
            a, b, cin : in  std_logic;
            sum, cout : out std_logic
        );
    end component;

    signal a, b, cin, sum, cout : std_logic                    := '0';
    -- Using SLV allows using a for loop to iterate through bit combinations.
    signal combi                : std_logic_vector(2 downto 0) := "000";

    constant time_tick : time := 20ns;
begin
    uut : singleBitAdder port map (
        a      => a,
        b      => b,
        cin    => cin,
        sum    => sum,
        cout   => cout
    );

    run: process
    begin
        for val in 0 to 7 loop -- equivalent to "000" to "111" in binary.
            combi <= std_logic_vector(to_unsigned(val, 3));

            a   <= combi(2);
            b   <= combi(1);
            cin <= combi(0);

            wait for time_tick;
        end loop;

        for delay in 0 to 2 loop -- Loops twice else values don't go low.
            combi <= "000";

            a   <= combi(2);
            b   <= combi(1);
            cin <= combi(0);

            wait for time_tick;
        end loop;

        wait;
    end process run;
    
end architecture testing;