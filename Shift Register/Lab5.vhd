

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Lab5 is
  Port (
  CLK, Preload,Dir, Reset: in std_logic;
  X: in std_logic_vector(3 downto 0);
  Y: out std_logic );
end entity Lab5;

architecture Behavioral of Lab5 is
signal shift_reg : std_logic_vector(3 downto 0);

begin
process (CLK, Reset, Preload, Dir, shift_reg) begin

if (Reset = '0') then
    shift_reg <= "0000";
    Y <='0';
    
elsif rising_edge(CLK) then
    if (Preload = '1') then
        shift_reg <= X;
    elsif (Dir = '0') then      
          shift_reg <= '0' & shift_reg(3 downto 1);  
        
        
        else
        shift_reg <= shift_reg (2 downto 0) & '0';
         
        end if;
            
   end if;
    if (Dir = '0') then
    Y <= shift_reg(0);
    else
       Y <= shift_reg(3);
    end if;


    end process;

end Behavioral;
