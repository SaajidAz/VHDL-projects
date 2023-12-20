----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 09:25:11 PM
-- Design Name: 
-- Module Name: Lab10 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab10 is
 Port ( 
 CLK, A: in std_logic;
 
 Y: out std_logic
 );
end Lab10;

architecture Behavioral of Lab10 is
type state_type is (s0, s1, s2, s3); 
    signal state: state_type; 
begin
process (CLK, A) begin
if rising_edge(CLK) then
    case state is
                when s0 => 
                y<='0';
                if A = '1' then
                state <= s1;
                else state <= s0;
                end if;
                --state 1
                when s1 =>
                 if A = '0' then
                state <= s2;
                else state <= s0;
                end if;
                --state2
                when s2 =>  if A = '1' then
                state <= s3;
                else state <= s0;
                end if;
                --state 3
                when s3 =>  if A = '1' then
                state <= s0;
                Y <= '1';
                else Y<='0';
                end if;
                
                when others =>
                state <= s0;
    
                end case;
                
                
                
              end if;

    


    end process;


end Behavioral;
