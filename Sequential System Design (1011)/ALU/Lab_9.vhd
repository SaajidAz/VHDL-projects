----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 03:43:49 PM
-- Design Name: 
-- Module Name: Lab_9 - Behavioral
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
use IEEE.NUMERIC_STD.All;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity Lab_9 is
generic (N: integer := 8);
  Port (S: in std_logic_vector (3 downto 0);
 A : in std_logic_vector (N-1 downto 0);
 B : in std_logic_vector (N-1 downto 0);
 Carry_Out: out std_logic;
 F : out std_logic_vector (N-1 downto 0) );
end Lab_9;

architecture Behavioral of Lab_9 is


begin
process (S, A, B) is

begin 
    case S is
       when "0000" =>
       F <= A + B;
       when "0001" =>
       F <= A - B; 
       when "0010" =>
       F <= A + (not B); 
       when "0011" =>
       F <= (A or B) + A;  
       when "0100" => 
       F <= (A or (not B)) + A;  
       when "0101" =>
       F <= (A and B) + A; 
       when "0110" =>
       F <= A+1; 
       when "0111" =>
       F <= A-1;       
       when "1000" =>
       F <= A and B;
       when "1001" =>
       F <= A or B;
       when "1010" =>
       F <= A xor B; 
       when "1011" =>
       F <= A XNOR B;
       when "1100" =>
       F<= not A; 
       when "1101" =>
       F <= not B;
      when "1110" => 
            Carry_Out <= A(0);
        for i in 0 to N-2 loop
            F(i) <= A(i + 1);
        end loop;
            F(N-1) <= '0';
            
        when others => 
         Carry_Out <= A(N-1);
         For i in 0 to N-2 loop
            F(i+1) <= A(i);
         end loop; 
         F(0) <= '0';
    
         end case;
        
    
        
        
        

end process;
end Behavioral;
