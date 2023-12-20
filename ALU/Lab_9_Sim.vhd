
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.All;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity Lab_9_Sim is
--  Port ( );
end Lab_9_Sim;

architecture Behavioral of Lab_9_Sim is


component Lab_9

    port(
    S: in std_logic_vector (3 downto 0);
 A : in std_logic_vector (7 downto 0);
 B : in std_logic_vector (7 downto 0);
 Carry_Out: out std_logic;
 F : out std_logic_vector (7 downto 0) );
end component;

signal S: std_logic_vector(3 downto 0);
signal A,B,F : std_logic_vector(7 downto 0);
signal Carry_Out: std_logic;



begin



UUT:Lab_9
port map(
S => S,
A => A,
B => B, 
Carry_Out => Carry_Out,
F => F
);

signalA: process begin
--A(31 downto 8)<= "000000000000000000000000";
--A(7 downto 0) <= "10101101";
A <= "10101101";
--A<= "00110100010111111010101111001101";
wait;
end process;
signalB: process begin
--B(31 downto 8)<= "000000000000000000000000";
--B(7 downto 0) <= "11101111";
B<= "11101111";
--B<= "00010010001111111011101001011101";
wait;
end process;


signalS: process begin
S <= "0000";
wait for 100ns;
S <= "0001";
wait for 100ns;
S <= "0010";
wait for 100ns;
S <= "0011";
wait for 100ns;
S <= "0100";
wait for 100ns;
S <= "0101";
wait for 100ns;
S <= "0110";
wait for 100ns;
S <= "0111";
wait for 100ns;
S <= "1000";
wait for 100ns;
S <= "1001";
wait for 100ns;
S <= "1010";
wait for 100ns;
S <= "1011";
wait for 100ns;
S <= "1100";
wait for 100ns;
S <= "1101";
wait for 100ns;
S <= "1110";
wait for 100ns;
S <= "1111";
wait;
 end process;






end Behavioral;
