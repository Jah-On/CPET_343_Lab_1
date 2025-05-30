/*

Author: John Schulz
Created: 29/05/2025

Xor gate for single bit adder.

*/
library IEEE;
use IEEE.std_logic_1164.all;

entity alu_xor is
    port (
        xor_x, xor_y : in  std_logic;
        xor_res      : out std_logic
    );
end entity alu_xor;

architecture xerox of alu_xor is
begin
    xor_vals: process(xor_x, xor_y)
    begin
        xor_res <= xor_x xor xor_y;
    end process xor_vals;
end architecture xerox;