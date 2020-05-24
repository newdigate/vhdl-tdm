library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;

architecture testbench of counter_tb is
  signal  clk:    std_logic := '0';
  signal  din:    std_logic := '0';
  signal  wclk:   std_logic := '0';
  signal  n_rst:  std_logic := '0';

  signal  cout1:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout2:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout3:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout4:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout5:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout6:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout7:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout8:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout9:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout10:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout11:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout12:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout13:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout14:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout15:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cout16:   std_logic_vector (15 downto 0) := (others => '0');

  signal  valid:   std_logic_vector (15 downto 0) := (others => '0');
  signal  reencoded:   std_logic := '0';
  
begin
  dut: entity work.tdm_decoder port map (clk, din, wclk, n_rst, cout1, cout2, cout3, cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13,cout14,cout15,cout16, valid);
  dup: entity work.tdm_encoder port map (clk, wclk, n_rst, cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8, cout9, cout10, cout11, cout12, cout13, cout14, cout15, cout16, valid, reencoded);
  
  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  process
  begin
    n_rst <= '0';
    wait for 10 ns;
    n_rst <= '1';
    wait for 5000 ns;
  end process;


  process
  begin
    wclk <= '0';
    wait for 10 ns;
    wclk <= '1';
    din <= not din;
    wait for 2500 ns;
  end process;
end;
