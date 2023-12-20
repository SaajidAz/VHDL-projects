library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Lab4_Sim is

end Lab4_Sim;

architecture Test_bench of Lab4_Sim is
  
    component Lab4 is
        Port(Reset, CLK, Enable, Up_Down: in std_logic;
             Q: out std_logic_vector(3 downto 0));
    end component;
   
    signal Reset, CLK, Enable, Up_Down: std_logic;
    signal Q: std_logic_vector(3 downto 0);
begin
    UUT:Lab4
    
    PORT MAP (Reset => Reset, 
              CLK => CLK, 
              Enable => Enable, 
              Up_Down => Up_Down, 
              Q => Q);

SignalClk: PROCESS 
begin
    CLK <= '0';
    loop
    wait for 50 ns;
    CLK <= not CLK;
    end loop;
end PROCESS;


SignalReset: PROCESS
begin
    Reset <= '0';
    wait for 300 ns;
    Reset <= '1';
    wait;
end PROCESS;


SignalEnable: PROCESS
begin
    Enable <= '1';
    wait for 1700 ns;
    Enable <= '0';
    wait for 600 ns;
    Enable <= '1';
    wait;
end PROCESS;

SignalUpDown: PROCESS
begin
    Up_Down <= '0';
    wait for 200 ns;
    Up_Down <= '1';
    wait for 1700 ns;
    Up_Down <= '0';
    wait;
end PROCESS;

end Test_bench;