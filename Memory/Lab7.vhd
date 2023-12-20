----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2023 01:24:36 AM
-- Design Name: 
-- Module Name: Lab7 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Lab7 is
    Port (Reset, Read_Write, CLK, Chip_Enable: in std_logic;
          Address: in std_logic_vector(4 downto 0);
          Data_In: in std_logic_vector(7 downto 0);
          Data_Out: out std_logic_vector(7 downto 0));
end Lab7;

architecture Behavioral of Lab7 is
    subtype word is std_logic_vector(7 downto 0);
    type memory is array(31 downto 0) of word;
    signal ram: memory;
    signal out_reg: std_logic_vector(7 downto 0);
begin
    process(CLK, Reset, Chip_Enable)
    begin
        if Reset = '0' then
           ram <= (others => "00000000"); 
           out_reg <= "00000000";
        elsif Chip_Enable = '0' then
            out_reg <= "ZZZZZZZZ";
        elsif rising_edge(CLK) then
            if Read_Write = '0' then
                
                out_reg <= ram(to_integer(unsigned(Address)));
            else
               
                ram(to_integer(unsigned(Address))) <= Data_In;
                out_reg <= "00000000";
            end if;
        end if;
    end process;
    
    Data_Out <= out_reg;
end Behavioral;
