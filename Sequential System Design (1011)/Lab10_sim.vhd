----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 09:25:28 PM
-- Design Name: 
-- Module Name: Lab10_sim - Behavioral
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

entity Lab10_sim is
--  Port ( );
end Lab10_sim;

architecture Behavioral of Lab10_sim is
    
    component Lab10 is
    port (
     CLK, A: in std_logic;
   
    Y: out std_logic
    );
    end component;
    signal CLK, Y, A: std_logic;
    


begin

    UUT: Lab10
    port map(
    CLK => CLK,
    Y => Y,
    A => A

);



SignalClk: PROCESS
begin
    CLK <= '0';
    loop
        wait for 40 ns;
        CLK <= not CLK;
    end loop;
end PROCESS;

SignalA: process
begin
A<='1';
wait for 100ns;
A<=not A;
wait for 50ns;
A <= not A;
wait for 550ns;
A<= not A;
wait for 100ns;
A<=not A;
wait for 400ns;
A <= not A;
wait; 
end process;

end Behavioral;
