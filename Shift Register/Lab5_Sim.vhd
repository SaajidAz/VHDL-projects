


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Lab5_Sim is

end Lab5_Sim;

architecture Behavioral of Lab5_Sim is
    signal CLK, Preload, Dir, Reset: std_logic;
  signal X: std_logic_vector(3 downto 0);
        component Lab5
        Port (
  CLK, Preload,Dir, Reset: in std_logic;
  X: in std_logic_vector(3 downto 0);
  Y: out std_logic );
  end component;
  
  signal Y: std_logic;
  
begin
    UUT:Lab5
    port map(
    CLK => CLK,
    Preload => Preload,
    Dir => Dir,
    Reset => Reset,
        X => X,
        Y => Y    );

SignalReset: process
begin
Reset <= '0';
wait for 300ns;
Reset <= not Reset;
wait;
end process;


SignalCLK: process
begin
CLK <= '0';


loop
wait for 50ns;
CLK <= not CLK;
end loop;
end process;

SignalPreload:process
begin
Preload <= '0';

wait for 200ns;
Preload <= not Preload;
wait for 200ns;
Preload <= not Preload;
wait for 700ns;
Preload <= not Preload;
wait for 100ns;
Preload <= not Preload;
wait;
end process;


signalDir: process
begin
Dir <= '0';
wait for 1100ns;
Dir <= not Dir;
wait;
end process;

SignalX: process
begin
X<= "1011";
wait for 500ns;
X<="0100";
wait for 600ns;
X<="1110";
wait;
end process;


end Behavioral;
