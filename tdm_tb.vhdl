library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tdm_tb is
end entity;

architecture testbench of tdm_tb is
  signal  clk:    std_logic := '0';
  signal  din:    std_logic := '0';
  signal  wclk:   std_logic := '1';
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

  signal  input_valid:   std_logic_vector (15 downto 0) := (others => '0');

  signal  valid:   std_logic_vector (15 downto 0) := (others => '0');
  signal  reencoded:   std_logic := '0';

  signal  cin1:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin2:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin3:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin4:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin5:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin6:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin7:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin8:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin9:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin10:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin11:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin12:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin13:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin14:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin15:   std_logic_vector (15 downto 0) := (others => '0');
  signal  cin16:   std_logic_vector (15 downto 0) := (others => '0');

  signal saw_wave:  signed(15 downto 0) := (others => '1');

begin
  enc: entity work.tdm_encoder port map (clk, wclk, n_rst, cin1, cin2, cin3, cin4, cin5, cin6, cin7, cin8, cin9, cin10, cin11, cin12, cin13, cin14, cin15, cin16, input_valid, din);
  dec: entity work.tdm_decoder port map (clk, din, wclk, n_rst, cout1, cout2, cout3, cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13,cout14,cout15,cout16, valid);
  
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
    input_valid <= (others => '1'); 
    wait for 1000000 ns;
  end process;


  process
  begin
    wclk <= '1';
    wait for 10 ns;

    while true loop
      wclk <= '0';
      wait for 10 ns;

      wclk <= '1';
      saw_wave <= saw_wave + 1;
      wait for 2550 ns;  
    end loop;
  

  end process;

  cin1 <= std_logic_vector(saw_wave);
  cin2 <= std_logic_vector(saw_wave);
  cin3 <= std_logic_vector(saw_wave);
  cin4 <= std_logic_vector(saw_wave);
  cin5 <= std_logic_vector(saw_wave);
  cin6 <= std_logic_vector(saw_wave);
  cin7 <= std_logic_vector(saw_wave);
  cin8 <= std_logic_vector(saw_wave);
  cin9 <= std_logic_vector(saw_wave);
  cin10 <= std_logic_vector(saw_wave);
  cin11 <= std_logic_vector(saw_wave);
  cin12 <= std_logic_vector(saw_wave);
  cin13 <= std_logic_vector(saw_wave);
  cin14 <= std_logic_vector(saw_wave);
  cin15 <= std_logic_vector(saw_wave);
  cin16 <= std_logic_vector(saw_wave);
end;
