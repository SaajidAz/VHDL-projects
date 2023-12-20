library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab7_Sim is
end Lab7_Sim;

architecture Behavioral of Lab7_Sim is
    component Lab7 is
        Port (Reset, Read_Write, CLK, Chip_Enable: in std_logic;
          Address: in std_logic_vector(4 downto 0);
          Data_In: in std_logic_vector(7 downto 0);
          Data_Out: out std_logic_vector(7 downto 0));
    end component;
    
    signal Reset, Read_Write, CLK, Chip_Enable: std_logic;
    signal Address: std_logic_vector(4 downto 0);
    signal Data_In: std_logic_vector(7 downto 0);
    signal Data_Out: std_logic_vector(7 downto 0);
    
begin
    UUT: Lab7
    PORT MAP (
        CLK => CLK,
        Chip_Enable => Chip_Enable,
        Read_Write => Read_Write,
        Reset => Reset,
        Address => Address,
        Data_In => Data_In,
        Data_Out => Data_Out);
    
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

SignalRead_Write: PROCESS
begin
    Read_Write <= '0';
    wait for 600 ns;
    Read_Write <= '1';
    wait for 1000 ns;
    Read_Write <= '0';
    wait;
end PROCESS;

SignalChip_Enable: PROCESS
begin
    Chip_Enable <= '0';
    wait for 500 ns;
    Chip_Enable <= '1';
    wait;
end PROCESS;

SignalAddress: PROCESS
begin
    Address <= "00000";
    wait for 800 ns;
    Address <= "01000";
    wait for 100 ns;
    Address <= "01001";
    wait for 100 ns;
    Address <= "01010";
    wait for 100 ns;
    Address <= "01011";
    wait for 100 ns;
    Address <= "01100";
    wait for 100 ns;
    Address <= "01101";
    wait for 100 ns;
    Address <= "01110";
    wait for 300 ns;  
    Address <= "01101";
    wait for 100 ns;
    Address <= "01100";
    wait for 100 ns;
    Address <= "01011";
    wait for 100 ns;
    Address <= "01010";
    wait for 100 ns;
    Address <= "01001";
    wait for 100 ns;
    Address <= "01000";
    wait; 
end PROCESS;

SignalData_In: PROCESS
begin
    Data_In <= x"00";
    wait for 800 ns;
    Data_In <= x"48";
    wait for 100 ns;
    Data_In <= x"75";
    wait for 100 ns;
    Data_In <= x"6D";
    wait for 100 ns;
    Data_In <= x"62";
    wait for 100 ns;
    Data_In <= x"65";
    wait for 100 ns;
    Data_In <= x"72";
    wait for 100 ns;
    Data_In <= x"21";
    wait for 100 ns;
    Data_In <= x"00";
    wait;
end PROCESS;

end Behavioral;
