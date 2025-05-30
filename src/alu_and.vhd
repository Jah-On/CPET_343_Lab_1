library IEEE;
use IEEE.std_logic_1164.all;

entity alu_and is
    port (
        and_x, and_y : in  std_logic;
        and_res      : out std_logic
    );
end entity alu_and;

architecture andy of alu_and is
begin
    and_vals: process(and_x, and_y)
    begin
        and_res <= and_x and and_y;
    end process and_vals;
end architecture andy;