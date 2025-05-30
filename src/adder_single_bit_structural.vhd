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

architecture structuralImpl of singleBitAdder is
    signal sum_xor_res                                             : std_logic;
    signal b_and_c_sig, a_and_b_sig, a_and_c_sig, anded_a_or_sig   : std_logic;
begin
    sum_xor_b_c : entity work.alu_xor port map (
        xor_x   => b,
        xor_y   => cin,
        xor_res => sum_xor_res
    );
    sum_xor : entity work.alu_xor port map (
        xor_x   => sum_xor_res,
        xor_y   => a,
        xor_res => sum
    );

    cout_and_b_c : entity work.alu_and port map (
        and_x   => b,
        and_y   => cin,
        and_res => b_and_c_sig
    );
    cout_and_a_b : entity work.alu_and port map (
        and_x   => a,
        and_y   => b,
        and_res => a_and_b_sig
    );
    cout_and_a_c : entity work.alu_and port map (
        and_x   => a,
        and_y   => cin,
        and_res => a_and_c_sig
    );
    cout_or_and_a : entity work.alu_or port map (
        or_x   => a_and_b_sig,
        or_y   => a_and_c_sig,
        or_res => anded_a_or_sig
    );
    cout_or : entity work.alu_or port map (
        or_x   => b_and_c_sig,
        or_y   => anded_a_or_sig,
        or_res => cout
    );
    
end architecture structuralImpl;