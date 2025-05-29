/*

Author: John Schulz
Created: 29/05/2025

Single bit adder as a behavioral implementation. Takes two bits and a carry in
and outputs a sum and carry out. 

*/
library IEEE;
use IEEE.std_logic_1164.all;

entity singleBitAdder is
    port (
        a, b, cin : in  std_logic;
        sum, cout : out std_logic
    );
end singleBitAdder;

architecture behavioralImpl of singleBitAdder is
    signal combi : std_logic_vector(2 downto 0);
begin
    -- Combine signals for simplicity
    update_combi: process(a, b, cin)
    begin
        combi <= a & b & cin;
    end process update_combi;

    assign_results: process(combi)
    begin
        case combi is
            when "001" | "010" | "100" | "111" => sum <= '1';
            when others                        => sum <= '0';
        end case;

        case combi is
            when "011" | "101" | "110" | "111" => cout <= '1';
            when others                        => cout <= '0';
        end case;
    end process assign_results;    
    
end architecture behavioralImpl;