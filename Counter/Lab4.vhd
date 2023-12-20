library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Lab4 is
    
    Port(Reset, CLK, Enable, Up_Down: in std_logic;
    Q: out std_logic_vector(3 downto 0));

end Lab4;

architecture Behavioral of Lab4 is

    signal Count: unsigned (3 downto 0);
begin
    
    Counter_Process:process(Reset, CLK, Enable, Up_Down) begin
        if (Reset = '0') then
            if (Up_Down = '0') then
                Count <= "0000";
            else
                Count <= "1111";
            end if;
        elsif (Enable = '1') and (rising_edge(CLK)) then
            if (Up_Down = '0') then
                Count <= Count+1;
            else
                Count <= Count-1;
            end if;
        end if;
    end process;
    
    Q <= std_logic_vector(Count);
end Behavioral;