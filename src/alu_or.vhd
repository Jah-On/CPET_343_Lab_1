/*

Author: John Schulz
Created: 29/05/2025

Or gate for single bit adder.

*/
library IEEE;
use IEEE.std_logic_1164.all;

entity alu_or is
    port (
        or_x, or_y : in  std_logic;
        or_res     : out std_logic
    );
end entity alu_or;

architecture oreo of alu_or is
begin
    or_vals: process(or_x, or_y)
    begin
        or_res <= or_x or or_y;
    end process or_vals;
end architecture oreo;